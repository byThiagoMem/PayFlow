import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/home/widgets/tickets_info.dart';
import 'package:pay_flow_flutter/app/shared/models/user_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class CustomAppBar extends PreferredSize {
  final double size;
  final UserModel user;
  final bool isHome;

  CustomAppBar({
    Key? key,
    required this.size,
    required this.user,
    required this.isHome,
  }) : super(
          key: key,
          preferredSize: Size(double.maxFinite, isHome ? size * .24 : size * .15),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: constraints.maxWidth * .06,
                      left: constraints.maxWidth * .06,
                      top: size * .07,
                    ),
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.bottomCenter,
                        radius: .8,
                        colors: [AppTheme.colors.brandGradient, AppTheme.colors.brandPrimary],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Olá, ',
                                style: AppTheme.textStyles.heading20W,
                                children: [
                                  TextSpan(
                                    text: '${user.name.split(' ')[0]}\n',
                                    style: AppTheme.textStyles.heading20W.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: 'Mantenha suas contas em dia',
                                    style: AppTheme.textStyles.heading13.copyWith(
                                      color: AppTheme.colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(user.imageUrl),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isHome,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: constraints.maxHeight * .10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          child: SizedBox(
                            width: constraints.maxWidth * .88,
                            height: constraints.maxHeight * .38,
                            child: AnimatedCard(
                              direction: AnimatedCardDirection.top,
                              child: const TicketsInfo(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
}
