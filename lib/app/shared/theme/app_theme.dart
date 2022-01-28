import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_colors.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_images.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_text_styles.dart';

class AppTheme {
  static AppColors get colors => AppColorsDefault();
  static AppImages get images => AppImagesDefault();
  static AppTextStyles get textStyles => AppTextStylesDefault();

  static const MaterialColor color = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(_primaryValue),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );
  static const int _primaryValue = 0xFFFF941A;

  static void systemChromePreferences(Brightness statusBarIconBrightness) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black87,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: color,
    primaryColor: color,
    iconTheme: IconThemeData(color: AppTheme.colors.brandPrimary),
    scaffoldBackgroundColor: AppTheme.colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppTheme.colors.textInputs),
    ),
  );
}
