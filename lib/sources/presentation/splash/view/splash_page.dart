import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';
import 'package:lgs_revpro/sources/route/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacementNamed(context, AppRoute.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Image.asset(
          AppImages.steadfastLogo,
          fit: BoxFit.scaleDown,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
    );
  }
}
