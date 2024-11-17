import 'package:get_it/get_it.dart';

import '../presentation/dashboard/bloc/dashboard_bloc.dart';
import '../presentation/login/bloc/login_bloc.dart';
import '../presentation/registration/bloc/registration_bloc.dart';
import '../presentation/registration/pages/account_otp_verify/bloc/account_otp_verify_bloc.dart';
import '../presentation/registration/pages/register_form/bloc/register_form_bloc.dart';
import '../presentation/registration/pages/username_verify/bloc/username_verify_bloc.dart';

final sl = GetIt.instance;

// NetworkClient defaultNetworkClient() => NetworkClientProvider().provideDefaultClient();

// NetworkClient appAuthenticationNetworkClient() => NetworkClientProvider().provideAppAuthenticationClient();

// NetworkClient userAuthenticationNetworkClient() => NetworkClientProvider().provideUserAuthenticationClient(sl());

void init() {
  blocsInjection();
  repositoriesInjection();
}

//user authentication
void blocsInjection() {
  // sl.registerFactory(() => SplashBloc(appAuthenticationRepository: sl(), userAuthenticationRepository: sl()));

  //Register
  sl.registerFactory(() => RegistrationBloc());
  sl.registerFactory(() => UsernameVerifyBloc());
  sl.registerFactory(() => AccountOtpVerifyBloc());
  sl.registerFactory(() => RegisterFormBloc());
  //login
  sl.registerFactory(() => LoginBloc());

  //dashboard
  sl.registerFactory(
    () => DashboardBloc(),
  );
}

///repositories injection
void repositoriesInjection() {
  // sl.registerFactory<UserAuthenticationRepository>(
  //   () => UserAuthenticationRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
  // );

  // sl.registerFactory<TransactionPinRepository>(
  //   () => TransactionPinRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );
  // sl.registerFactory<UserVerificationRepository>(
  //   () => UserVerificationRepositoryImpl(
  //     networkClient: userAuthenticationNetworkClient(),
  //     appAuthenticationNetworkClient: appAuthenticationNetworkClient(),
  //   ),
  // );
  // sl.registerFactory<AppAuthenticationRepository>(
  //   () => AppAuthenticationRepositoryImpl(networkClient: defaultNetworkClient()),
  // );
  // sl.registerFactory<UserRegistrationRepository>(
  //   () => UserRegistrationRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
  // );
  // sl.registerFactory<ExchangeRateRepository>(
  //   () => ExchangeRateRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );
  // sl.registerFactory<OTPRepository>(
  //   () => SendOtpRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
  // );
  // sl.registerLazySingleton<ReceiverRepository>(
  //   () => ReceiverRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );
  // sl.registerLazySingleton<UserUtilitiesRepository>(
  //   () => UserUtilitiesRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );
  // sl.registerLazySingleton<TransactionActivityRepository>(
  //   () => TransactionRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );
  // sl.registerFactory<CatalogRepository>(() => CatalogRepositoryImpl(networkClient: appAuthenticationNetworkClient()));

  // sl.registerLazySingleton<ChangeProfilePicRepository>(
  //   () => ChangeProfilePicRepositoryImpl(networkClient: userAuthenticationNetworkClient()),
  // );

  // sl.registerFactory<EkycRepository>(
  //   () => EkycRepositoryImpl(networkClient: appAuthenticationNetworkClient()),
  // );

  // //topup
  // sl.registerFactory<TopUpRepository>(() => TopUpRepositoryImpl(networkClient: userAuthenticationNetworkClient()));
}
