import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    LoadingView.hide();
    super.didPop(route, previousRoute);
  }
}
