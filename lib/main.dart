import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/core/shared_ui/switch_language.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:movie_app/ui/auth/login/login_screen.dart';
import 'package:movie_app/ui/auth/register/register_screen.dart';
import 'package:movie_app/ui/onboarding/onboarding_screen.dart';
import 'package:movie_app/ui/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: SwitchLanguage.localeNotifier,
      builder: (context, locale, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(DarkAppColors()).theme,
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            OnboardingScreen.routeName: (context) => const OnboardingScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
