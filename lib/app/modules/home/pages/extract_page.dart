import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/home/widgets/tickets_tiles.dart';
import 'package:pay_flow_flutter/app/shared/extensions/app_text_styles.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/widgets/custom_app_bar.dart';

class ExtractPage extends StatelessWidget {
  final UserModel user;
  const ExtractPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  'Meus extratos'.heading20(),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1),
                  const SizedBox(height: 5),
                  const TicketsTiles(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
