import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class TicketsInfo extends StatelessWidget {
  const TicketsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.colors.brandSecundary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppTheme.images.barCode,
            color: AppTheme.colors.brandBackground,
            width: 56,
            height: 34,
          ),
          Container(width: 1, height: 32, color: AppTheme.colors.brandBackground),
          Text.rich(
            TextSpan(
              text: 'Você tem ',
              style: AppTheme.textStyles.heading13.copyWith(color: AppTheme.colors.white),
              children: [
                TextSpan(
                  text: '14 boletos\n',
                  style: AppTheme.textStyles.heading13.copyWith(fontWeight: FontWeight.bold, color: AppTheme.colors.white),
                ),
                TextSpan(
                  text: 'cadastrados para pagar',
                  style: AppTheme.textStyles.heading13.copyWith(color: AppTheme.colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
