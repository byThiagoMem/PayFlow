import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class TicketsTiles extends StatelessWidget {
  final List<TicketModel> tickets;
  const TicketsTiles({Key? key, required this.tickets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {},
              child: ListTile(
                title: tickets[index].name.heading17(),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Vence em ',
                    style: AppTheme.textStyles.heading13.copyWith(fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: tickets[index].dueDate,
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
                        text: tickets[index].value.toStringAsFixed(2),
                        style: AppTheme.textStyles.heading15.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            );
          },
          itemCount: tickets.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
