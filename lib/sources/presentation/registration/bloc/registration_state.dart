part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String emailAddress;

  const RegistrationState({
    this.emailAddress = "",
  });


  RegistrationState copyWith({
    String? emailAddress,
  }) {
    return RegistrationState(
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }


  @override
  List<Object?> get props => [emailAddress];
}
