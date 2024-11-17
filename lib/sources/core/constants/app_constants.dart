class AppConstants {
  static const dateTimeFormat = "dd/MM/yyyy hh:mm aa";
  // static const countryImageUrl = "https://uatinceptionblobstorage.blob.core.windows.net/country-flag-iso3/";
  static const countryImageUrl = "https://uatinceptionblobstorage.blob.core.windows.net/country-flags/";
  static const countryImageIso3Url = "https://uatinceptionblobstorage.blob.core.windows.net/country-flag-iso3/";
  static const defaultFlagUrl = "https://uatinceptionblobstorage.blob.core.windows.net/country-flags/sg.png";
  static const defaultIso3FlagUrl = "https://uatinceptionblobstorage.blob.core.windows.net/country-flag-iso3/sgp.svg";

  static const termAndConditionLink = "https://www.steadfastmoneytransfer.com/terms-and-conditions/";
  static const privacyPolicy = "https://www.steadfastmoneytransfer.com/privacy-policy/";
  static const dataPolicy = "https://forexjapan.co.jp/forexjapan/dataPolicy.html";
  static const supportEmail = "Info@steadfastmoneytransfer.com";
  static const supportPhone = "+65 67348035";
  static const senderCountry = "Singapore";
  static const senderCountryCode = "SGP";
  static const nepalCountryCode = "NPL";
  static const senderCurrencyCode = "SGD";
  static const senderDialingCode = "+65";
  static const pinLength = 6;
  static const other = "10";
  static const others = "99";

  //azure upload document type
  static const front = "front";
  static const back = "back";
  static const additional = "additional";
  static const selfie = "selfie";
  static const receipt = "receipt";
  static const profilePic = "profilePic";
  static const customer = "customer";

  //azure wallet
  static const walletTopupReceipt = "wallet_top_up_receipt";
}

enum ScanBy { camera, library }

enum ScanType { primary, secondary, additional, selfie }
