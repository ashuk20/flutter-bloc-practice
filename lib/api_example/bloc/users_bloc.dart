import 'package:bloc/bloc.dart';
import 'package:bloc_practice/api_example/model/users_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<PullToRefresh>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(UsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
      );
      if (response.statusCode == 200) {
        final users = usersModelFromJson(response.body);
        emit(UsersSuccess(users: users));
      } else {
        emit(UsersFailure(error: "Failed to load users"));
      }
    } catch (e) {
      emit(UsersFailure(error: e.toString()));
    }
  }

}
