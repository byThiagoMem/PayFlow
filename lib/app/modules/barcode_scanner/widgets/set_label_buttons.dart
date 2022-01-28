import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:pay_flow_flutter/app/shared/widgets/divider_vertical.dart';

import 'label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecundaryColor;
  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secundaryLabel,
      required this.secundaryOnPressed,
      this.enablePrimaryColor = false,
      this.enableSecundaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.shapesBoxes,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrimaryColor ? AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.brandPrimary) : null,
            ),
          ),
          const DividerVertical(),
          Expanded(
            child: LabelButton(
              label: secundaryLabel,
              onPressed: secundaryOnPressed,
              style: enableSecundaryColor ? AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.brandPrimary) : null,
            ),
          ),
        ],
      ),
    );
  }
}
