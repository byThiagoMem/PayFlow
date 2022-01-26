import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/models/barcode_scanner_status.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/widgets/custom_bottom_sheet.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/widgets/set_label_buttons.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

import 'barcode_scanner_store.dart';

class BarcodeScannerPage extends StatefulWidget {
  final String title;
  const BarcodeScannerPage({Key? key, this.title = 'BarcodeScannerPage'}) : super(key: key);
  @override
  BarcodeScannerPageState createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final BarcodeScannerStore store = Modular.get();

  @override
  void initState() {
    store.getAvailableCameras();
    store.statusNotifier.addListener(() {
      if (store.status.hasBarcode) store.goToInsertTicketPage();
    });
    super.initState();
  }

  @override
  dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: store.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: store.cameraController!.buildPreview(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: AppTheme.colors.black,
                iconTheme: IconThemeData(color: AppTheme.colors.white),
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.white),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () {},
                secundaryLabel: 'Adicionar da galeria',
                secundaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: store.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return CustomBottomSheet(
                  primaryLabel: 'Escanear novamente',
                  primaryOnPressed: () => store.scanWithCamera(),
                  secundaryLabel: 'Digitar código',
                  secundaryOnPressed: store.goToInsertTicketPage,
                  title: 'Não foi possível identificar um código de barras. ',
                  subtitle: 'Tente escanear novamente ou digite o código do seu boleto.',
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
