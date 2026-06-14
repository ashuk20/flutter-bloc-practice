import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  Future<void> _onSignUpButtonPressed(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    await Future.delayed(const Duration(seconds: 5));

    emit(
      SignUpSuccess(
        name: event.name,
        lastName: event.lastName,
        number: event.number,
      ),
    );
  }
}
