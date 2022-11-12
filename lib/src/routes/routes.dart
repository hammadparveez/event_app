import 'package:event_app/src/view/home/home.dart';
import 'package:event_app/src/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/home';
  static const onboard = '/onboard';
  

  static Route<dynamic>? onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case onboard:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
