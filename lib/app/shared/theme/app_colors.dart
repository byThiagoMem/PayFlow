import 'package:flutter/material.dart';

abstract class AppColors {
  Color get brandGradient;
  Color get brandPrimary;
  Color get brandSecundary;
  Color get brandBackground;

  Color get textHeading;
  Color get textBody;
  Color get textInputs;

  Color get actionsDelete;

  Color get shapesStroke;
  Color get shapesBoxes;

  Color get black;
  Color get white;
}

class AppColorsDefault implements AppColors {
  @override
  Color get brandBackground => const Color(0xFFFFFFFF);

  @override
  Color get brandGradient => const Color(0xFFFFC480);

  @override
  Color get brandPrimary => const Color(0xFFFF941A);

  @override
  Color get brandSecundary => const Color(0xFF585666);

  @override
  Color get textBody => const Color(0xFF706E7A);

  @override
  Color get textHeading => const Color(0xFF585666);

  @override
  Color get textInputs => const Color(0xFFB1B0B8);

  @override
  Color get actionsDelete => const Color(0xFFd40808);

  @override
  Color get shapesBoxes => const Color(0xFFFAFAFC);

  @override
  Color get shapesStroke => const Color(0xFFE3E3E6);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get white => const Color(0xFFFFFFFF);
}
