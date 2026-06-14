part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String name;
  final String lastName;
  final String number;

  SignUpButtonPressed({
    required this.name,
    required this.lastName,
    required this.number,
  });
}
