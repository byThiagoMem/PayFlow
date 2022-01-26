import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/login/repositories/login_repository.dart';

import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final _loginRepository = Modular.get<LoginRepository>();

  @override
  Future<void> loginWithGoogle() => _loginRepository.loginWithGoogle();
}
