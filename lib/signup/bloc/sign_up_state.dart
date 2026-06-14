part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String name;
  final String lastName;
  final String number;

    SignUpSuccess({
    required this.name,
    required this.lastName,
    required this.number,
  });
}

class SignUpFailure extends SignUpState {
  final String error;
  SignUpFailure(this.error);
}
