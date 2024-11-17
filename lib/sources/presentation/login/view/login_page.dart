import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/presentation/widgets/app_bar/app_bar.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: const MyAppBar(
          allowBack: false,
        ),
        body: const LoginForm(),
      ),
    );
  }
}
