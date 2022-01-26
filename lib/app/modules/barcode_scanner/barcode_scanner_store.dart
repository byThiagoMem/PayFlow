import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/models/barcode_scanner_status.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';

part 'barcode_scanner_store.g.dart';

class BarcodeScannerStore = _BarcodeScannerStoreBase with _$BarcodeScannerStore;

abstract class _BarcodeScannerStoreBase with Store {
  final statusNotifier = ValueNotifier<BarcodeScannerStatus>(BarcodeScannerStatus());

  BarcodeScannerStatus get status => statusNotifier.value;
  set status(BarcodeScannerStatus status) => statusNotifier.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  CameraController? cameraController;

  void getAvailableCameras() async {
    try {
      final response = await availableCameras(); //Obter se o dispositivo tem câmeras disponiveis
      final camera =
          response.firstWhere((element) => element.lensDirection == CameraLensDirection.back); //Obter a primeira camera traseira disponível
      cameraController = CameraController(camera, ResolutionPreset.max, enableAudio: false); //Configurando a camera
      await cameraController!.initialize();

      scanWithCamera();
      listenCamera();
    } catch (e) {
      log(e.toString(), error: e);
      status = BarcodeScannerStatus.error(e.toString());
    }
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false) {
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());
            const InputImageRotation imageRotation = InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat = InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ?? InputImageFormat.NV21;
            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              },
            ).toList();

            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );
            final inputImageCamera = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
            scannerBarCode(inputImageCamera);
          } catch (e) {
            log(e.toString());
          }
        }
      });
    }
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      String? barcode;
      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeScannerStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }
      return;
    } catch (e) {
      log('Erro na leitura ${e.toString()}');
    }
  }

  void scanWithCamera() {
    status = BarcodeScannerStatus.available(); //Alterando o status da controller
    Future.delayed(const Duration(seconds: 20)).then((value) {
      if (status.hasBarcode == false) {
        status = BarcodeScannerStatus.error('Timeout of boleto lecture');
      }
    });
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) cameraController!.dispose();
  }

  void goToInsertTicketPage() => Modular.to.pushReplacementNamed(AppRoutes.inserTicket, arguments: status.barcode);
}
