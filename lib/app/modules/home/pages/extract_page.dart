import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/home_store.dart';
import 'package:pay_flow_flutter/app/modules/home/widgets/tickets_tiles.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/widgets/custom_app_bar.dart';

class ExtractPage extends StatelessWidget {
  final UserModel user;
  const ExtractPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeStore>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: CustomAppBar(
            size: constraints.maxHeight,
            user: user,
            isHome: false,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .06),
              child: Observer(builder: (_) {
                String stringQuantityTicketspaids = store.paidTickets.length <= 1 ? 'pago' : 'pagos';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Meus extratos'.heading20(),
                        '${store.paidTickets.length} $stringQuantityTicketspaids'.heading13(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 1),
                    const SizedBox(height: 5),
                    TicketsTiles(tickets: store.paidTickets),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
