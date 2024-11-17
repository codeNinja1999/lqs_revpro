import 'package:lgs_revpro/sources/config/app/app_config.dart';

AppConfig uatConfig(String version) => AppConfig(
      flavor: AppFlavour.uat,
      baseUrl: "",
      imageBaseUlr: "",
      appKey: "",
      version: version,
    );
