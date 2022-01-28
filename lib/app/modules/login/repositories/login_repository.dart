import 'package:pay_flow_flutter/app/shared/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel?> loginWithGoogle();
}
