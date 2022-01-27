import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/home/services/home_service.dart';
import 'package:pay_flow_flutter/app/shared/controllers/auth/auth_controller.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _homeService = Modular.get<HomeService>();
  final _authController = Modular.get<AuthController>();

  @observable
  AppState signOutState = AppState.IDLE;

  @observable
  int currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }

  void goToBarcodeScannerPage() => Modular.to.pushNamed(AppRoutes.barcodescanner);

  Future<void> signOutWithGoogle() async {
    signOutState = AppState.LOADING;
    try {
      await _homeService.signOutWithGoogle();
      await _authController.signOut();
      signOutState = AppState.SUCCESS;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      signOutState = AppState.ERROR;
    }
  }
}
