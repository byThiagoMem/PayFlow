import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/repositories/home_repository_impl.dart';
import 'package:pay_flow_flutter/app/modules/home/services/home_service_impl.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => HomeRepositoryImpl()),
    Bind.lazySingleton((i) => HomeServiceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(user: args.data)),
  ];
}
