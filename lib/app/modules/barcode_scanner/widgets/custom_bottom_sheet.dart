import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/modules/barcode_scanner/widgets/set_label_buttons.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class CustomBottomSheet extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final String title;
  final String subtitle;
  const CustomBottomSheet({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secundaryLabel,
    required this.secundaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: SafeArea(
        child: Material(
          child: Container(
            color: AppTheme.colors.shapesBoxes,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black87,
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                          text: '$title\n',
                          style: AppTheme.textStyles.heading15.copyWith(fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                              text: subtitle,
                              style: AppTheme.textStyles.heading15.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(height: 1, color: AppTheme.colors.shapesStroke),
                    SetLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secundaryLabel: secundaryLabel,
                      secundaryOnPressed: secundaryOnPressed,
                      enablePrimaryColor: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
