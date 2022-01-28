import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/login/widgets/social_button.dart';
import 'package:pay_flow_flutter/app/shared/base/base_page.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  List<ReactionDisposer>? _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??= [
      reaction(
        (_) => store.loginState,
        (_) {
          switch (store.loginState) {
            case AppState.LOADING:
              BasePage.showLoading(context);
              break;
            default:
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: constrains.maxHeight * .4,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.bottomCenter,
                        radius: .6,
                        colors: [
                          AppTheme.colors.brandGradient,
                          AppTheme.colors.brandPrimary,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: constrains.maxHeight * .08,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(AppTheme.images.woman, height: constrains.maxHeight * .47),
                  ],
                ),
              ),
              Positioned(
                top: constrains.maxHeight * .58,
                child: Container(
                  width: constrains.maxWidth * .21,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        spreadRadius: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Image.asset(AppTheme.images.barCode),
                ),
              ),
              Positioned(
                top: constrains.maxHeight * .68,
                child: Center(
                  child: 'Organize seus\nboletos em um\nsó lugar'.heading32(),
                ),
              ),
              Positioned(
                top: constrains.maxHeight * .88,
                child: SocialButton(
                  onTap: () => store.loginWithGoogle(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
