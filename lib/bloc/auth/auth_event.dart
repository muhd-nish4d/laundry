part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class PhoneNumberSubmittEvent extends AuthEvent {
  final String phoneNumber;

  const PhoneNumberSubmittEvent(this.phoneNumber);
}

class OTPVerificationEvent extends AuthEvent {
  final String otp;

  const OTPVerificationEvent(this.otp);
}
