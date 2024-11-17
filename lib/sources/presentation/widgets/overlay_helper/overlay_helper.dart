import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

extension SystemUiOverlayStyleHelper on SystemUiOverlayStyle {
  static SystemUiOverlayStyle get system =>
      PlatformDispatcher.instance.platformBrightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  static SystemUiOverlayStyle get light => SystemUiOverlayStyle.dark;

  static SystemUiOverlayStyle get dark => SystemUiOverlayStyle.light;
}
