import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class TicketsTiles extends StatelessWidget {
  const TicketsTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemBuilder: (_, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: 'Aluguel de Fevereiro'.heading17(),
              subtitle: Text.rich(
                TextSpan(
                  text: 'Vence em ',
                  style: AppTheme.textStyles.heading13.copyWith(fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: '05/02/22',
                      style: AppTheme.textStyles.heading13.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              trailing: Text.rich(
                TextSpan(
                  text: 'R\$ ',
                  style: AppTheme.textStyles.heading15,
                  children: [
                    TextSpan(
                      text: '650,00',
                      style: AppTheme.textStyles.heading15.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            );
          },
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
