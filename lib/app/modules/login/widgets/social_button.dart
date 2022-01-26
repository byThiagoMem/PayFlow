import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.colors.shapesStroke),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppTheme.images.googleIcon,
                  height: 28,
                  width: 28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(height: 64, width: 1, color: AppTheme.colors.shapesStroke),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: 'Entrar com Google'.heading15(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
