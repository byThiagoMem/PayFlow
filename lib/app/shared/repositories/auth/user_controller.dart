import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';

class UserController {
  User? user;

  UserController() {
    init();
  }
  void init() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        this.user = user;
        if (user == null) {
          Modular.to.pushReplacementNamed(Modular.initialRoute, arguments: null);
        } else {
          Modular.to
              .pushReplacementNamed(Modular.initialRoute, arguments: UserModel(id: user.uid, name: user.displayName!, imageUrl: user.photoURL!));
        }
      },
    );
  }
}
