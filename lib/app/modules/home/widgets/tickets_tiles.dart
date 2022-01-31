import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/home/home_store.dart';
import 'package:pay_flow_flutter/app/shared/base/base_page.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/extensions/formaters.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

class TicketsTiles extends StatefulWidget {
  final List<TicketModel> tickets;
  final bool onTap;
  const TicketsTiles({Key? key, required this.tickets, required this.onTap}) : super(key: key);

  @override
  State<TicketsTiles> createState() => _TicketsTilesState();
}

class _TicketsTilesState extends State<TicketsTiles> {
  final store = Modular.get<HomeStore>();

  List<ReactionDisposer>? _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??= [
      reaction((_) => store.changeTicketsState, (_) {
        switch (store.changeTicketsState) {
          case AppState.LOADING:
            BasePage.showLoading(context);
            break;
          case AppState.SUCCESS:
            Modular.to.popUntil(ModalRoute.withName(AppRoutes.home));
            break;
          default:
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ListView.builder(
          itemBuilder: (_, index) {
            return InkWell(
              splashColor: AppTheme.colors.brandGradient,
              highlightColor: AppTheme.colors.brandGradient.withOpacity(.5),
              borderRadius: BorderRadius.circular(5),
              onTap: widget.onTap
                  ? () {
                      BasePage.showModal(
                        context,
                        ticket: widget.tickets[index],
                        onTapYes: () async => await store.payTicket(widget.tickets[index]).then((_) => setState(() {})),
                        onTapDelete: () async => await store.deleteTicket(widget.tickets[index]).then((_) => setState(() {})),
                      );
                    }
                  : null,
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
                    text: widget.tickets[index].value.reais(),
                    style: AppTheme.textStyles.heading15.copyWith(fontWeight: FontWeight.bold),
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
