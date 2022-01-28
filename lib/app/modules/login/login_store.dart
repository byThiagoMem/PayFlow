import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/login/services/login_service.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final _loginService = Modular.get<LoginService>();

  @observable
  AppState loginState = AppState.IDLE;

  Future<void> loginWithGoogle() async {
    loginState = AppState.LOADING;
    try {
      UserModel? _user = await _loginService.loginWithGoogle();
      if (_user != null) {
        Modular.to.pushReplacementNamed(AppRoutes.home, arguments: _user);
      } else {
        loginState = AppState.ERROR;
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      loginState = AppState.ERROR;
    }
  }
}
