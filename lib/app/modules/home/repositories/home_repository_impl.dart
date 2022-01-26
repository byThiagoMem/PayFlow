import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<void> signOutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }
}
