import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/shared/controllers/auth/auth_controller.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final _authController = Modular.get<AuthController>();

  @observable
  AppState loginState = AppState.IDLE;

  Future<void> checkLoggedInUser() async {
    loginState = AppState.LOADING;
    try {
      _authController.currentUser();
      loginState = AppState.SUCCESS;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      loginState = AppState.ERROR;
    }
  }

  void goToLoginPage() => Modular.to.navigate(AppRoutes.login);
}
