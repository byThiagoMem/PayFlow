import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';

class AppTextStyles {}

extension AppTextStyle on String {
  Text heading32() => Text(
        this,
        style: GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.w600, color: AppTheme.colors.textHeading),
        textAlign: TextAlign.center,
      );

  Text heading20() => Text(
        this,
        style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.colors.textHeading),
      );

  Text heading17() => Text(
        this,
        style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.colors.textHeading),
      );

  Text heading15() => Text(
        this,
        style: GoogleFonts.inter(fontSize: 15, color: AppTheme.colors.textHeading),
      );

  Text heading13() => Text(
        this,
        style: GoogleFonts.inter(fontSize: 13, color: AppTheme.colors.black),
      );
}
