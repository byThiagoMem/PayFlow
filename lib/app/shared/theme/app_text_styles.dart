import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

abstract class AppTextStyles {
  TextStyle get heading32;
  TextStyle get heading20B;
  TextStyle get heading20W;
  TextStyle get heading15;
  TextStyle get heading13;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get heading13 => GoogleFonts.inter(fontSize: 13, color: AppTheme.colors.textHeading);

  @override
  TextStyle get heading15 => GoogleFonts.inter(fontSize: 15, color: AppTheme.colors.black);

  @override
  TextStyle get heading20B => GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w400, color: AppTheme.colors.textHeading);

  @override
  TextStyle get heading20W => GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w400, color: AppTheme.colors.white);

  @override
  TextStyle get heading32 => GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.w600, color: AppTheme.colors.textHeading);
}
