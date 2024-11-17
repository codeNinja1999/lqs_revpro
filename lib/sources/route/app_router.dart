import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lgs_revpro/sources/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:lgs_revpro/sources/presentation/login/login.dart';
import 'package:lgs_revpro/sources/route/route.dart';

import '../di/injector.dart';
import '../presentation/dashboard/dashboard_page.dart';
import '../presentation/data_form/data_form_page.dart';
import '../presentation/registration/bloc/registration_bloc.dart';
import '../presentation/registration/view/registration_page.dart';
import '../presentation/splash/view/splash_page.dart';

T? tryCast<T>(dynamic object) => object is T ? object : null;

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case AppRoute.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case AppRoute.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<LoginBloc>(),
            child: const LoginPage(),
          ),
        );

      case AppRoute.registerPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<RegistrationBloc>(),
            child: const RegistrationPage(),
          ),
        );

      case AppRoute.dashboard:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<DashboardBloc>(),
            child: const DashboardPage(),
          ),
        );

      case AppRoute.dataForm:
        return MaterialPageRoute(
          builder: (context) => const DataFormPage(),
        );

      default:
        return MaterialPageRoute(builder: ((context) => Container(color: Colors.green)));
    }
  }
}
