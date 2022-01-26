import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/repositories/home_repository.dart';

import './home_service.dart';

class HomeServiceImpl implements HomeService {
  final _homeRepository = Modular.get<HomeRepository>();

  @override
  Future<void> signOutWithGoogle() => _homeRepository.signOutWithGoogle();
}
