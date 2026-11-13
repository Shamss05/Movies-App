import 'dart:ui';

abstract class AppColors {
  Color get primaryColor;

  Color get onPrimaryColor;

  Color get secondaryColor;

  Color get onSecondaryColor;

  Color get surfaceColor;

  Color get onSurfaceColor;

  Color get errorColor;

  Color get onErrorColor;

  Brightness get brightness;
}

class DarkAppColors extends AppColors {
  @override
  Color get primaryColor => const Color(0xFFF6BD00);

  @override
  Color get onPrimaryColor => const Color(0xFF121312);

  @override
  Color get secondaryColor => const Color(0xFFE82626);

  @override
  Color get onSecondaryColor => const Color(0xFFFFFFFF);

  @override
  Color get surfaceColor => const Color(0xFF282A28);

  @override
  Color get onSurfaceColor => const Color(0xFFFFFFFF);

  @override
  Color get errorColor => const Color(0xFFE82626);

  @override
  Color get onErrorColor => const Color(0xFFFFFFFF);

  @override
  Brightness get brightness => Brightness.dark;
}
