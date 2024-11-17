import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lgs_revpro/sources/di/injector.dart';

import '../pages/account_otp_verify/account_otp_verify.dart';
import '../pages/confirm_pin/confirm_pin_page.dart';
import '../pages/register_form/register_form.dart';
import '../pages/set_pin/set_pin.dart';
import '../pages/username_verify/username_verify.dart';
import 'registration_route.dart';

class RegistrationRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case RegistrationRoute.newUsernameVerify:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<UsernameVerifyBloc>(),
            child: const UsernameVerifyPage(),
          ),
        );

      case RegistrationRoute.otpVerify:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AccountOtpVerifyBloc>(),
            child: const AccountOtpVerifyPage(),
          ),
        );

      case RegistrationRoute.registerForm:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<RegisterFormBloc>(),
            child: const RegisterFormPage(),
          ),
        );

      case RegistrationRoute.setNetPin:
        return MaterialPageRoute(
          builder: (_) => const SetPinPage(),
        );

      case RegistrationRoute.confirmPin:
        return MaterialPageRoute(
          builder: (_) => const ConfirmTransactionPinPage(),
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
