import 'package:flutter/material.dart';
import 'package:movie_app/ui/auth/login/login_screen.dart';
import 'package:movie_app/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/app_logo.png",
                width: 121,
                height: 118,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Image.asset(
            "assets/route_logo.png",
            width: MediaQuery.sizeOf(context).width * 0.3,
          ),
        ],
      ),
    );
  }
}
