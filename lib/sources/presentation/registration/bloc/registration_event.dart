part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class VerificationDetailCollected extends RegistrationEvent {
  final String emailAddress;
  VerificationDetailCollected({required this.emailAddress});
}
