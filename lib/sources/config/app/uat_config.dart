import 'package:lgs_revpro/sources/config/app/app_config.dart';

AppConfig uatConfig(String version) => AppConfig(
      flavor: AppFlavour.uat,
      baseUrl: "https://steadfastmoneytransfer.iremit.com.my/MobileApi/v1/",
      imageBaseUlr: "https://uatinceptionblobstorage.blob.core.windows.net/transactiondocuments/",
      appKey: "8sjdoijfoijsdfsf",
      version: version,
    );
