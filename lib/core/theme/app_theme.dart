import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class AppTheme {
  final AppColors appColors;

  AppTheme(this.appColors);

  ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: appColors.brightness,
    scaffoldBackgroundColor: appColors.onPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: appColors.onPrimaryColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: appColors.primaryColor),
      titleTextStyle: TextStyle(
        color: appColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appColors.primaryColor,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    ),
    colorScheme: ColorScheme(
      brightness: appColors.brightness,
      primary: appColors.primaryColor,
      onPrimary: appColors.onPrimaryColor,
      secondary: appColors.secondaryColor,
      onSecondary: appColors.onSecondaryColor,
      error: appColors.errorColor,
      onError: appColors.onErrorColor,
      surface: appColors.surfaceColor,
      onSurface: appColors.onSurfaceColor,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: appColors.surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      hintStyle: TextStyle(
        color: appColors.onSurfaceColor.withValues(alpha: 0.6),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: appColors.onSurfaceColor,
      suffixIconColor: appColors.onSurfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1.5, color: appColors.primaryColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          width: 1,
          color: appColors.onSurfaceColor.withValues(alpha: 0.38),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: appColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1.5, color: appColors.errorColor),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: appColors.primaryColor,
        foregroundColor: appColors.onPrimaryColor,
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColors.primaryColor,
        foregroundColor: appColors.onPrimaryColor,
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        elevation: 0,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(double.infinity, 56),
        side: BorderSide(color: appColors.primaryColor, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        foregroundColor: appColors.primaryColor,
        backgroundColor: Colors.transparent,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColors.surfaceColor,
      selectedItemColor: appColors.primaryColor,
      unselectedItemColor: appColors.onSurfaceColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: appColors.onSurfaceColor),
      bodyMedium: TextStyle(color: appColors.onSurfaceColor),
      bodySmall: TextStyle(
        color: appColors.onSurfaceColor.withValues(alpha: 0.7),
      ),
      labelLarge: TextStyle(
        color: appColors.onSurfaceColor,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: appColors.onSurfaceColor.withValues(alpha: 0.7),
      ),
      labelSmall: TextStyle(
        color: appColors.onSurfaceColor.withValues(alpha: 0.7),
      ),
    ),
  );
}
