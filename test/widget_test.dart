import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:movie_app/ui/auth/login/login_screen.dart';
import 'package:movie_app/ui/auth/register/register_screen.dart';

Widget _buildTestApp({
  required Widget home,
  Locale locale = const Locale('en'),
}) {
  return MaterialApp(
    theme: AppTheme(DarkAppColors()).theme,
    locale: locale,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      ...GlobalMaterialLocalizations.delegates,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    routes: {
      LoginScreen.routeName: (context) => const LoginScreen(),
      RegisterScreen.routeName: (context) => const RegisterScreen(),
      ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
    },
    home: home,
  );
}

void main() {
  testWidgets('LoginScreen renders fields, buttons, and navigates', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_buildTestApp(home: const LoginScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forget Password ?'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Create One'), findsOneWidget);
    expect(find.text('OR'), findsOneWidget);
    expect(find.text('Login With Google'), findsOneWidget);
  });

  testWidgets('RegisterScreen renders avatar selector and 5 fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_buildTestApp(home: const RegisterScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Avatar'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
  });

  testWidgets('ForgetPasswordScreen renders illustration, email, and button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_buildTestApp(home: const ForgetPasswordScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Forget Password'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Verify Email'), findsOneWidget);
  });
}
