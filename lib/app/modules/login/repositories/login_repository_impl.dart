import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow_flutter/app/shared/controllers/auth/auth_controller.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final authController = Modular.get<AuthController>();

  @override
  Future<void> loginWithGoogle() async {
    final _googleUser = await GoogleSignIn().signIn();
    final _googleAuth = await _googleUser?.authentication;

    if (_googleAuth != null) {
      try {
        final _credential = GoogleAuthProvider.credential(
          accessToken: _googleAuth.accessToken,
          idToken: _googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(_credential);
        final _user = UserModel(name: _googleUser!.displayName!, imageUrl: _googleUser.photoUrl!);
        await authController.setUser(_user);
      } catch (e, s) {
        log(e.toString(), error: e, stackTrace: s);
        await authController.setUser(null);
      }
    } else {
      await authController.setUser(null);
    }
  }
}
