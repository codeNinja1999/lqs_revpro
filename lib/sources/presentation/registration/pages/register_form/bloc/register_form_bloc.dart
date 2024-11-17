import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lgs_revpro/sources/core/app_core.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc() : super(RegisterFormState()) {
    on<FullNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });
    on<DateOfBirthChanged>(_onDateOfBirthChanged);
    on<GenderChanged>(_onGenderChanged);
    on<NiNChanged>(_onNiNChanged);
    on<AddressChanged>(_onAddressChanged);
    on<OccupationChanged>(_onOccupationChanged);

    on<MobileChanged>((event, emit) {
      emit(state.copyWith(mobileNumber: event.mobileNumber));
    });

    on<PasswordChanged>((event, emit) {
      final isEightCharacterValid = AppRegex.eightDigit.hasMatch(event.password);
      final isUpperCaseValid = AppRegex.oneLetterCapital.hasMatch(event.password);
      final isNumericalValueValid = AppRegex.spacialAndNumeric.hasMatch(event.password);

      emit(
        state.copyWith(
          password: event.password,
          isEightCharacterValid: isEightCharacterValid,
          isUpperCaseValid: isUpperCaseValid,
          isNumericalValueValid: isNumericalValueValid,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<RegisterUser>(_onRegisterUser);
  }
  void _onDateOfBirthChanged(DateOfBirthChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  void _onGenderChanged(GenderChanged event, Emitter<RegisterFormState> emit) {}
  void _onAddressChanged(AddressChanged event, Emitter<RegisterFormState> emit) {}
  void _onNiNChanged(NiNChanged event, Emitter<RegisterFormState> emit) {}
  void _onOccupationChanged(OccupationChanged event, Emitter<RegisterFormState> emit) {}

  void _onRegisterUser(
    RegisterUser event,
    Emitter<RegisterFormState> emit,
  ) async {
    // emit(state.copyWith(status: InProgress()));
    // final response = await userRegistrationRepository.register(state.makeRegistrationInfo);
    // emit(
    //   response.fold(
    //     (error) => state.copyWith(status: SubmissionFailure(error)),
    //     (right) => state.copyWith(status: Success()),
    //   ),
    // );
  }
}
