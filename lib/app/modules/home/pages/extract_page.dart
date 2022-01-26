import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/widgets/custom_app_bar.dart';

class ExtractPage extends StatelessWidget {
  final UserModel user;
  const ExtractPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: CustomAppBar(
            size: constraints.maxHeight,
            user: user,
            isHome: false,
          ),
        );
      },
    );
  }
}
