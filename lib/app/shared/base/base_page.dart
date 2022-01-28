// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/widgets/custom_button.dart';

class BasePage {
  static showLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return loading();
      },
    );
  }

  static showModal(BuildContext context, {required VoidCallback onTapYes, required VoidCallback onTapDelete, required TicketModel ticket, required}) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: AppTheme.colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: constraints.maxHeight * .03),
                  Container(
                    height: 2,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppTheme.colors.textInputs,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .05),
                  Text.rich(
                    TextSpan(
                      text: 'O boleto ',
                      style: AppTheme.textStyles.heading20B.copyWith(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: '${ticket.name}\n', style: AppTheme.textStyles.heading20B.copyWith(fontWeight: FontWeight.w600)),
                        TextSpan(text: 'no valor de R\$ ', style: AppTheme.textStyles.heading20B),
                        TextSpan(
                            text: '${ticket.value.toStringAsFixed(2)}\n',
                            style: AppTheme.textStyles.heading20B.copyWith(fontWeight: FontWeight.w600)),
                        TextSpan(text: 'foi pago?', style: AppTheme.textStyles.heading20B),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: constraints.maxHeight * .06),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .06),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: 'Ainda não',
                            onPressed: Modular.to.pop,
                            height: constraints.maxHeight * .12,
                            backgroundcolor: AppTheme.colors.shapesBoxes,
                            titleStyle: AppTheme.textStyles.heading15,
                          ),
                        ),
                        SizedBox(width: constraints.maxWidth * .04),
                        Expanded(
                          child: CustomButton(
                            title: 'Sim',
                            onPressed: onTapYes,
                            height: constraints.maxHeight * .12,
                            backgroundcolor: AppTheme.colors.brandPrimary,
                            titleStyle: AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .04),
                  const Divider(thickness: 1),
                  SizedBox(height: constraints.maxHeight * .01),
                  InkWell(
                    onTap: onTapDelete,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_forever, color: AppTheme.colors.actionsDelete),
                        SizedBox(width: constraints.maxWidth * .03),
                        Text(
                          'Deletar Boleto',
                          style: AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.actionsDelete),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * .04),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget loading() => Center(
        child: Container(
          width: 70.0,
          height: 70.0,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.colors.white),
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            color: AppTheme.colors.brandGradient,
          ),
        ),
      );
}
