import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/modules/home/pages/extract_page.dart';
import 'package:pay_flow_flutter/app/modules/home/pages/my_tickets_page.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final UserModel user;
  const HomePage({Key? key, this.title = "Home", required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: [
            MyTicketsPage(key: UniqueKey(), user: widget.user),
            ExtractPage(key: UniqueKey(), user: widget.user),
          ][store.currentPage],
          bottomNavigationBar: Observer(
            builder: (_) {
              return Container(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * .02),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() => controller.setPage(0));
                      },
                      icon: Icon(
                        Icons.home,
                        color: store.currentPage == 0 ? AppTheme.colors.brandPrimary : AppTheme.colors.textBody,
                      ),
                    ),
                    GestureDetector(
                      onTap: store.goToBarcodeScannerPage,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.brandPrimary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.add_box_outlined,
                          color: AppTheme.colors.brandBackground,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => controller.setPage(1));
                      },
                      icon: Icon(Icons.description_outlined,
                          color: controller.currentPage == 1 ? AppTheme.colors.brandPrimary : AppTheme.colors.textBody),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
