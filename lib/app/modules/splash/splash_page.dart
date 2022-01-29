import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  final String title;
  final UserModel? user;
  const SplashPage({Key? key, this.title = 'SplashPage', required this.user}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).whenComplete(
      () {
        if (widget.user != null) {
          store.goToHomePage(widget.user!);
        } else {
          store.goToLoginPage();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme.systemChromePreferences(Brightness.light);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppTheme.images.union),
                Image.asset(AppTheme.images.logotipo, width: constraints.maxWidth * .4),
              ],
            ),
          );
        },
      ),
    );
  }
}
