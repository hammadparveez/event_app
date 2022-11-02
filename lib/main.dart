import 'package:event_app/src/provider/onbaord_provider.dart';
import 'package:event_app/src/routes/routes.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:event_app/src/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const App({super.key});

  @override
  State<App> createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnBoardProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'airbnb',
          primaryColor: AppColors.primaryColor,
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(AppColors.white),
          )),
        ),
        navigatorKey: App.navigatorKey,
        initialRoute: AppRoutes.onboard,
        onGenerateRoute: AppRoutes.onRouteGenerate,
      ),
    );
  }
}
