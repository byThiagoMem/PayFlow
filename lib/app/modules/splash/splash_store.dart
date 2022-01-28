import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  void goToHomePage(UserModel user) => Modular.to.navigate(AppRoutes.home, arguments: user);

  void goToLoginPage() => Modular.to.pushNamed(AppRoutes.login);
}
