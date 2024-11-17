import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/presentation/login/login.dart';
import 'package:lgs_revpro/sources/route/route.dart';

import '../presentation/data_form/data_form_page.dart';
import '../presentation/registration/view/registration_page.dart';
import '../presentation/splash/view/splash_page.dart';

T? tryCast<T>(dynamic object) => object is T ? object : null;

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case AppRoute.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoute.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );

      case AppRoute.registerPage:
        return MaterialPageRoute(
          builder: (_) => const RegistrationPage(),
        );

      case AppRoute.dataForm:
        return MaterialPageRoute(
          builder: (_) => const DataFormPage(),
        );

      default:
        return MaterialPageRoute(builder: ((_) => Container(color: Colors.green)));
    }
  }
}
