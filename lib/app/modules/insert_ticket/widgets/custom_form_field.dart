import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 15),
            Icon(icon),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: 1,
              height: 49,
              color: AppTheme.colors.shapesStroke,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                validator: validator,
                style: AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.textBody),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: AppTheme.textStyles.heading15.copyWith(color: AppTheme.colors.textInputs),
                ),
              ),
            ),
          ],
        ),
        Container(height: 1, color: AppTheme.colors.shapesStroke),
      ],
    );
  }
}
