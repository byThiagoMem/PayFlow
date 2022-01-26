import 'package:flutter_modular/flutter_modular.dart';

import 'barcode_scanner_page.dart';
import 'barcode_scanner_store.dart';

class BarcodeScannerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BarcodeScannerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const BarcodeScannerPage()),
  ];
}
