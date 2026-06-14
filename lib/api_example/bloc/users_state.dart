part of 'users_bloc.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UsersModel> users;

  UsersSuccess({required this.users});
}

class UsersFailure extends UsersState {
  final String error;
  
  UsersFailure({required this.error});
}
