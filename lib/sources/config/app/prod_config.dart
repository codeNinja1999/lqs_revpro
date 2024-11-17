import 'package:lgs_revpro/sources/config/app/app_config.dart';

AppConfig productionConfig(String version) => AppConfig(
      flavor: AppFlavour.production,
      baseUrl: "https://steadfastmoneytransfer.iremit.com.my/MobileApi/v1/",
      imageBaseUlr: "https://uatinceptionblobstorage.blob.core.windows.net/transactiondocuments/",
      appKey: "8sjdoijfoijsdfsf",
      version: version,
    );
