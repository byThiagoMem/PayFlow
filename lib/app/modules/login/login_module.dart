import 'package:pay_flow_flutter/app/modules/login/login_Page.dart';
import 'package:pay_flow_flutter/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/login/repositories/login_repository_impl.dart';
import 'package:pay_flow_flutter/app/modules/login/services/login_service_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => LoginRepositoryImpl()),
    Bind.lazySingleton((i) => LoginServiceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
