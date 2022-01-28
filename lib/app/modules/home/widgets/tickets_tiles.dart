import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/home_store.dart';
import 'package:pay_flow_flutter/app/shared/base/base_page.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class TicketsTiles extends StatefulWidget {
  final List<TicketModel> tickets;
  const TicketsTiles({Key? key, required this.tickets}) : super(key: key);

  @override
  State<TicketsTiles> createState() => _TicketsTilesState();
}

class _TicketsTilesState extends State<TicketsTiles> {
  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeStore>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemBuilder: (_, index) {
            return InkWell(
              splashColor: AppTheme.colors.brandGradient,
              highlightColor: AppTheme.colors.brandGradient.withOpacity(.5),
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                BasePage.showModal(
                  context,
                  ticket: widget.tickets[index],
                  onTapYes: () async => await store.payTicket(widget.tickets[index]).then((_) => setState(() {})),
                  onTapDelete: () async => await store.deleteTicket(widget.tickets[index]).then((_) => setState(() {})),
                );
              },
              child: ListTile(
                title: widget.tickets[index].name.heading17(),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Vence em ',
                    style: AppTheme.textStyles.heading13.copyWith(fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: widget.tickets[index].dueDate,
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
                        text: widget.tickets[index].value.toStringAsFixed(2),
                        style: AppTheme.textStyles.heading15.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: widget.tickets.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
