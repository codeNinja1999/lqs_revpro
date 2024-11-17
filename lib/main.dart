import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';
import 'package:lgs_revpro/sources/route/app_route.dart';
import 'package:lgs_revpro/sources/route/app_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'sources/di/injector.dart' as di;
import 'sources/config/config.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  AppConfig.initialize(version: packageInfo.version);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'USA')],
      fallbackLocale: const Locale('en', 'USA'),
      path: "assets/language",
      child: ChangeNotifierProvider(
        create: (_) => ThemeConfig(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
      navigatorObservers: [AppNavigatorObserver()],
      initialRoute: AppRoute.login,
      onGenerateRoute: (settings) {
        return AppRouter.onGenerateRoute(settings, context);
      },
    );
  }
}
