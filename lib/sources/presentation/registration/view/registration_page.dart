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
  var currentRoute = RegistrationRoute.newUsernameVerify;

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPop: () {
        // if (currentRoute != RegistrationRoute.registerForm) {
          _navigatorKey.currentState!.pop();
        // }
      },
      child: Navigator(
        key: _navigatorKey,
        initialRoute: RegistrationRoute.newUsernameVerify,
        onGenerateRoute: (settings) {
          currentRoute = settings.name ?? RegistrationRoute.newUsernameVerify;
          return RegistrationRouter.onGenerateRoute(settings, context);
        },
      ),
    );
  }
}
