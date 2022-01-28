import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/home_store.dart';
import 'package:pay_flow_flutter/app/modules/home/widgets/tickets_tiles.dart';
import 'package:pay_flow_flutter/app/shared/base/base_page.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/widgets/custom_app_bar.dart';

class MyTicketsPage extends StatelessWidget {
  final UserModel user;
  const MyTicketsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeStore>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            user: user,
            size: constraints.maxHeight,
            isHome: true,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Meus boletos'.heading20(),
                      IconButton(
                        onPressed: store.signOutWithGoogle,
                        icon: Icon(Icons.logout, color: AppTheme.colors.textBody),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1),
                  const SizedBox(height: 5),
                  FutureBuilder(
                    future: store.getAllTickets(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return BasePage.loading();
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return TicketsTiles(tickets: store.unpaindTickets);
                      }
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const Center(
                          child: Text('Erro ao buscar boletos cadastrados'),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
