import 'package:flutter/material.dart';

import '../route/registration_route.dart';
import '../route/registration_router.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var currentRoute = RegistrationRoute.registerForm;

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPop: () {
        if (currentRoute != RegistrationRoute.registerForm) {
          _navigatorKey.currentState!.pop();
        }
      },
      child: Navigator(
        key: _navigatorKey,
        initialRoute: RegistrationRoute.registerForm,
        onGenerateRoute: (settings) {
          currentRoute = settings.name ?? RegistrationRoute.registerForm;
          return RegistrationRouter.onGenerateRoute(settings, context);
        },
      ),
    );
  }
}
