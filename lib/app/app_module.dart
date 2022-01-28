import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/barcode_scanner_module.dart';
import 'package:pay_flow_flutter/app/modules/home/home_module.dart';
import 'package:pay_flow_flutter/app/modules/splash/splash_module.dart';
import 'package:pay_flow_flutter/app/shared/repositories/auth/user_controller.dart';
import 'package:pay_flow_flutter/app/shared/repositories/ticket/ticket_repository_impl.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/services/ticket/ticket_service_impl.dart';

import 'modules/insert_ticket/insert_ticket_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserController()),
    Bind.lazySingleton((i) => TicketRepositoryImpl()),
    Bind.lazySingleton((i) => TicketServiceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(AppRoutes.login, module: LoginModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),
    ModuleRoute(AppRoutes.barcodescanner, module: BarcodeScannerModule()),
    ModuleRoute(AppRoutes.inserTicket, module: InsertTicketModule()),
  ];
}
