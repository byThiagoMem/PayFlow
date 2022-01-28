import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserModel?> loginWithGoogle() async {
    final _googleUser = await GoogleSignIn().signIn();
    final _googleAuth = await _googleUser?.authentication;

    if (_googleAuth != null) {
      final _credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(_credential);
      final _user = UserModel(name: _googleUser!.displayName!, imageUrl: _googleUser.photoUrl!, id: _googleUser.id);
      return _user;
    } else {
      return null;
    }
  }
}
