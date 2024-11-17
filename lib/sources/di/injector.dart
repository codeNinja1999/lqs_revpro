// import 'package:get_it/get_it.dart';



// final sl = GetIt.instance;

// NetworkClient defaultNetworkClient() => NetworkClientProvider().provideDefaultClient();

// NetworkClient appAuthenticationNetworkClient() => NetworkClientProvider().provideAppAuthenticationClient();

// NetworkClient userAuthenticationNetworkClient() => NetworkClientProvider().provideUserAuthenticationClient(sl());

// void init() {
//   blocsInjection();
//   repositoriesInjection();
// }

// //user authentication
// void blocsInjection() {
//   sl.registerFactory(() => SplashBloc(appAuthenticationRepository: sl(), userAuthenticationRepository: sl()));

//   //Register
//   sl.registerFactory(() => RegisterBloc());
//   sl.registerFactory(() => UserAgreementBloc());
//   sl.registerFactory(() => UsernameVerifyBloc(otpRepository: sl()));
//   sl.registerFactory(() => AccountOtpVerifyBloc(otpRepository: sl()));
//   sl.registerFactory(() => RegisterFormBloc(
//         userRegistrationRepository: sl(),
//         userAuthenticationRepository: sl(),
//       ));
//   sl.registerFactory(() => UserPersonalInformationBloc(
//         catalogRepository: sl(),
//         userUtilitiesRepository: sl(),
//       ));
//   // sl.registerFactory(() => AddressInformationBloc(
//   //       catalogRepository: sl(),
//   //       userUtilitiesRepository: sl(),
//   //     ));
//   sl.registerFactory(() => AccountTypeBloc());
//   sl.registerFactory(() => CheckOrganizationBloc(userRegistrationRepository: sl()));

//   //Kyc
//   sl.registerFactory(() => KycVerificationBloc(
//         userUtilitiesRepository: sl(),
//         userVerificationRepository: sl(),
//         userAuthenticationRepository: sl(),
//         userRegistrationRepository: sl(),
//         transactionPinRepository: sl(),
//       ));
//   sl.registerFactory(() => CurrentAddressBloc(catalogRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => VerificationInstructionBloc());
//   sl.registerFactory(() => PromotionBloc(appAuthenticationRepository: sl()));
//   sl.registerFactory(() => IdSelectionBloc(catalogRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => SelfieBloc(eKycRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => DocumentFrontBloc(eKycRepository: sl()));
//   sl.registerFactory(() => DocumentThicknessBloc(userVerificationRepository: sl()));
//   sl.registerFactory(() => DocumentBackBloc(userVerificationRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => DocumentInformationBloc(
//         catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//         userUtilitiesRepository: sl(),
//         userVerificationRepository: sl(),
//       ));
//   sl.registerFactory(() => PersonalInformationBloc(catalogRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => NewTransactionPinBloc(eKycRepository: sl(), transactionPinRepository: sl()));
//   sl.registerFactory(() => NewPasswordBloc());
//   sl.registerFactory(
//     () => UserVerifyBloc(
//       userUtilitiesRepository: sl(),
//       otpRepository: SendOtpRepositoryImpl(
//         userNetworkClient: userAuthenticationNetworkClient(),
//       ),
//     ),
//   );
//   sl.registerFactory(
//     () => PinOtpVerifyBloc(otpRepository: SendOtpRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient())),
//   );

//   //login
//   sl.registerFactory(() => DeviceVerificationBloc(otpRepository: sl(), userAuthenticationRepository: sl()));
//   sl.registerFactory(() => LoginBloc(userAuthenticationRepository: sl()));
//   sl.registerFactory(() => ForgotPasswordBloc());
//   sl.registerFactory(() => CheckNumberBloc(otpRepository: sl()));
//   sl.registerFactory(() => OtpVerifyBloc(otpRepository: sl()));
//   sl.registerFactory(() => SetPinBloc());
//   sl.registerFactory(
//     () => ResetPasswordBloc(
//       passwordRepository: PasswordRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
//     ),
//   );

//   sl.registerFactory(() => SetTransactionPinBloc(transactionPinRepository: sl(), userUtilitiesRepository: sl()));

//   //dashboard
//   sl.registerFactory(() => HomeTabBarBloc(userUtilitiesRepository: sl()));
//   sl.registerFactory(
//     () => DashboardBloc(
//       userUtilitiesRepository: sl(),
//       transactionActivityRepository: sl(),
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//       exchangeRepository: sl(),
//     ),
//   );
//   sl.registerFactory(
//     () => ChangePasswordBloc(
//       passwordRepository: PasswordRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//       otpRepository: sl(),
//     ),
//   );

//   sl.registerFactory(
//     () => ChangePasswordOtpVerifyBloc(
//       otpRepository: sl(),
//       // passwordRepository: PasswordRepositoryImpl(
//       //   networkClient: userAuthenticationNetworkClient(),
//       // ),
//     ),
//   );

//   sl.registerFactory(
//     () => CheckRateBloc(
//       transactionActivityRepository: sl(),
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//     ),
//   );
//   sl.registerFactory(
//     () => CurrencyChangerBloc(
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//     ),
//   );

// // Notification
//   sl.registerFactory(() => NotificationListBloc(userUtilitiesRepository: sl()));

//   //beneficiary
//   sl.registerFactory(() => BeneficiaryBloc());

//   sl.registerFactory(() => PersonalInfoBloc(
//         catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//         receiverRepository: sl(),
//         userUtilitiesRepository: sl(),
//       ));

//   //beneficiary list
//   sl.registerFactory(
//     () => BeneficiaryListBloc(
//       receiverRepository: sl(),
//       userUtilitiesRepository: sl(),
//     ),
//   );
//   sl.registerFactory(() => BeneficiaryDetailBloc(receiverRepository: sl()));
//   sl.registerFactory(() => FaqBloc());

//   //settings
//   sl.registerFactory(() => AccountBloc(userUtilitiesRepository: sl()));

//   sl.registerFactory(
//     () => UserPersonalInfoBloc(
//         userUtilitiesRepository: sl(), changeProfilePicRepository: sl(), userVerificationRepository: sl()),
//   );

//   sl.registerFactory(() => KycStatusBloc(userUtilitiesRepository: sl()));

//   //team
//   sl.registerFactory(() => OrganizationTeamListBloc(userUtilitiesRepository: sl()));

//   sl.registerFactory(() => StakeholderDetailBloc(userUtilitiesRepository: sl()));

//   sl.registerFactory(() => AddRepresentativeBloc(userVerificationRepository: sl(), userUtilitiesRepository: sl()));

//   sl.registerFactory(() => ChooseRoleBloc());

//   //sendmoney
//   sl.registerFactory(() => SendMoneyBloc(userUtilitiesRepository: sl()));
//   sl.registerFactory(() => SendMoneySuccessBloc());
//   sl.registerFactory(() => ConfirmDetailsBloc(transactionActivityRepository: sl(), userUtilitiesRepository: sl()));
//   // sl.registerFactory(
//   //   () => RemittanceBloc(
//   //     transactionActivityRepository: sl(),
//   //     catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//   //   ),
//   // );
//   sl.registerFactory(
//     () => ReceiverListBloc(
//       receiverRepository: sl(),
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//       transactionActivityRepository: sl(),
//     ),
//   );

//   sl.registerFactory(
//     () => PurposeOfTransferBloc(
//       receiverRepository: sl(),
//       transactionActivityRepository: sl(),
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//     ),
//   );

//   sl.registerFactory(
//     () => ExchangeRateBloc(
//       userUtilitiesRepository: sl(),
//       transactionActivityRepository: sl(),
//       catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//     ),
//   );

//   //transaction
//   sl.registerFactory(() => TransactionListBloc(transactionActivityRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(() => TransactionDetailBloc(
//         transactionActivityRepository: sl(),
//         userUtilitiesRepository: sl(),
//         otpRepository: sl(),
//       ));
//   sl.registerFactory(() => ApprovalListBloc(
//         userUtilitiesRepository: sl(),
//         transactionActivityRepository: sl(),
//       ));
//   sl.registerFactory(() => ApproveOtpBloc(otpRepository: sl(), transactionActivityRepository: sl()));
//   sl.registerFactory(() => ApprovalSuccessBloc());

//   sl.registerFactory(() => ReviewApprovalBloc(
//         userUtilitiesRepository: sl(),
//         otpRepository: SendOtpRepositoryImpl(
//           userNetworkClient: userAuthenticationNetworkClient(),
//         ),
//         transactionActivityRepository: sl(),
//       ));

//   //receipt
//   sl.registerFactory(() => ReceiptBloc());
//   sl.registerFactory(
//     () => DepositBankBloc(catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient())),
//   );
//   sl.registerFactory(() => UploadReceiptBloc());
//   sl.registerFactory(() => ConfirmReceiptBloc(transactionActivityRepository: sl()));

//   //topUp
//   sl.registerFactory(
//     () => PaymentMethodBloc(catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient())),
//   );

//   sl.registerFactory(() => PaymentMethodDetailBloc(
//         catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//         topUpRepository: sl(),
//         userVerificationRepository: sl(),
//         userUtilitiesRepository: sl(),
//       ));

//   sl.registerFactory(() => WalletTopupBloc());

//   //Corporate verification
//   sl.registerFactory(() => CorporateVerificationBloc(userUtilitiesRepository: sl(), userVerificationRepository: sl()));
//   sl.registerFactory(() => OrganizationDetailsBloc(catalogRepository: sl(), userUtilitiesRepository: sl()));

//   sl.registerFactory(
//     () => OrganizationAddressBloc(
//       catalogRepository: sl(),
//       userUtilitiesRepository: sl(),
//       userVerificationRepository: sl(),
//     ),
//   );
//   sl.registerFactory(
//     () => DocumentListBloc(catalogRepository: sl(), userVerificationRepository: sl(), userUtilitiesRepository: sl()),
//   );
//   sl.registerFactory(() => BeneficialOwnerDetailBloc(userVerificationRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(
//       () => AuthorizeRepresentativeDetailsBloc(userVerificationRepository: sl(), userUtilitiesRepository: sl()));
//   sl.registerFactory(
//     () => CorporateDocumentUploadBloc(userVerificationRepository: sl(), catalogRepository: sl()
//         // catalogRepository: CatalogRepositoryImpl(userNetworkClient: userAuthenticationNetworkClient()),
//         ),
//   );

//   sl.registerFactory<BalanceBloc>(() => sl());
// }

// ///repositories injection
// void repositoriesInjection() {
//   sl.registerFactory<UserAuthenticationRepository>(
//     () => UserAuthenticationRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
//   );

//   sl.registerFactory<TransactionPinRepository>(
//     () => TransactionPinRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );
//   sl.registerFactory<UserVerificationRepository>(
//     () => UserVerificationRepositoryImpl(
//       networkClient: userAuthenticationNetworkClient(),
//       appAuthenticationNetworkClient: appAuthenticationNetworkClient(),
//     ),
//   );
//   sl.registerFactory<AppAuthenticationRepository>(
//     () => AppAuthenticationRepositoryImpl(networkClient: defaultNetworkClient()),
//   );
//   sl.registerFactory<UserRegistrationRepository>(
//     () => UserRegistrationRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
//   );
//   sl.registerFactory<ExchangeRateRepository>(
//     () => ExchangeRateRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );
//   sl.registerFactory<OTPRepository>(
//     () => SendOtpRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
//   );
//   sl.registerLazySingleton<ReceiverRepository>(
//     () => ReceiverRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );
//   sl.registerLazySingleton<UserUtilitiesRepository>(
//     () => UserUtilitiesRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );
//   sl.registerLazySingleton<TransactionActivityRepository>(
//     () => TransactionRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );
//   sl.registerFactory<CatalogRepository>(() => CatalogRepositoryImpl(networkClient: appAuthenticationNetworkClient()));

//   sl.registerLazySingleton<ChangeProfilePicRepository>(
//     () => ChangeProfilePicRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
//   );

//   sl.registerFactory<EkycRepository>(
//     () => EkycRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
//   );

//   //topup
//   sl.registerFactory<TopUpRepository>(() => TopUpRepositoryImpl(networkClient: userAuthenticationNetworkClient()));
// }
