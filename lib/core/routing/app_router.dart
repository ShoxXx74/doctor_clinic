// ignore_for_file: unused_local_variable

import 'package:doctor_clinic/core/routing/routes.dart';
import 'package:doctor_clinic/features/login/ui/login_screen.dart';
import 'package:doctor_clinic/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed to screens
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Route Found for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
