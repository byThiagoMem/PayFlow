import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/shared/controllers/auth/auth_constants.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;

  Future<void> setUser(UserModel? user) async {
    if (user != null) {
      try {
        await _saveUser(user);
        _user = user;
        Modular.to.pushReplacementNamed(AppRoutes.home, arguments: user);
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
      }
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.login);
    }
  }

  Future<bool> _saveUser(UserModel user) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setString(AuthConstants.userKey, user.toJson());
      return true;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return false;
    }
  }

  Future<void> currentUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    if (_prefs.containsKey(AuthConstants.userKey)) {
      final json = _prefs.getString(AuthConstants.userKey) as String;
      setUser(UserModel.fromJson(json));
      return;
    } else {
      setUser(null);
    }
  }

  Future<void> signOut() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.remove(AuthConstants.userKey);
      _user = null;
      Modular.to.pushReplacementNamed(AppRoutes.login);
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      Modular.to.pushReplacementNamed(AppRoutes.login);
    }
  }
}
