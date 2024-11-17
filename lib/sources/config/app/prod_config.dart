import 'package:lgs_revpro/sources/config/app/app_config.dart';

AppConfig productionConfig(String version) => AppConfig(
      flavor: AppFlavour.production,
      baseUrl: "",
      imageBaseUlr: "",
      appKey: "",
      version: version,
    );
