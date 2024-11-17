import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lgs_revpro/sources/core/app_core.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class InitialLaunchSuccess extends FormStatus {}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {}
}
