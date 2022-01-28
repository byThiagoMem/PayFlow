import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundcolor;
  final TextStyle titleStyle;
  final double height;
  const CustomButton(
      {Key? key, required this.title, required this.onPressed, required this.backgroundcolor, required this.titleStyle, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title, style: titleStyle),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(double.maxFinite, height),
        onPrimary: AppTheme.colors.brandGradient,
        primary: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: AppTheme.colors.shapesStroke,
            width: 1,
          ),
        ),
      ),
    );
  }
}
