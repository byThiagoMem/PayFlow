import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/base/base_page.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();
  List<ReactionDisposer>? _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??= [
      reaction((_) => store.loginState, (_) {
        switch (store.loginState) {
          case AppState.LOADING:
            BasePage.showLoading(context);
            break;
          default:
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    AppTheme.systemChromePreferences(Brightness.light);
    Future.delayed(const Duration(seconds: 2)).whenComplete(() => store.checkLoggedInUser());
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
