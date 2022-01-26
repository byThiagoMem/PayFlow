abstract class AppImages {
  String get logotipo;
  String get union;
  String get woman;
  String get barCode;
  String get googleIcon;
}

class AppImagesDefault implements AppImages {
  @override
  String get barCode => 'assets/images/bar_code.png';

  @override
  String get googleIcon => 'assets/images/google_icon.png';

  @override
  String get logotipo => 'assets/images/logotipo.png';

  @override
  String get union => 'assets/images/union.png';

  @override
  String get woman => 'assets/images/woman.png';
}
