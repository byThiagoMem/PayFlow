import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/home_module.dart';
import 'package:pay_flow_flutter/app/modules/splash/splash_module.dart';
import 'package:pay_flow_flutter/app/shared/controllers/auth/auth_controller.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(AppRoutes.login, module: LoginModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),
  ];
}
