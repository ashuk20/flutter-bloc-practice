part of 'users_bloc.dart';

abstract class UsersEvent {}

class LoadUsers extends UsersEvent{}

class PullToRefresh extends UsersEvent{}