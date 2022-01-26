// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

enum ModalType { SUCCESS, ERROR, ACTION }

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

  static showModal(
    BuildContext context, {
    required ModalType type,
    required String title,
    required String subtitle,
    VoidCallback? onTapAction,
  }) {
    return Container();
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
