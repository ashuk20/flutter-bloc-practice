import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));

    if(event.email =="test@gmail.com" && event.password == "1234"){
      emit(LoginSuccess());
    }else{
      emit(LoginFailure("Invalid Email or password"));
    }
  }
}
