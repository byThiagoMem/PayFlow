import 'package:flutter/material.dart';

class AppSizes {}

extension AppSize on double {
  SizedBox hSpace(BuildContext context) {
    final fullScreenSize = MediaQuery.of(context).size.height;
    final space = (this * 100) / fullScreenSize;
    return SizedBox(height: space);
  }

  SizedBox wSpace(BuildContext context) {
    final fullScreenSize = MediaQuery.of(context).size.width;
    final space = (this * 100) / fullScreenSize;
    return SizedBox(width: space);
  }
}
