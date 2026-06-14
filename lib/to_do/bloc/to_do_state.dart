part of 'to_do_bloc.dart';

abstract class ToDoState {}

class TodoInitial extends ToDoState {}

class TodoLoading extends ToDoState {}

class TodoSuccess extends ToDoState {
  final List<TodoModel> todos;

  TodoSuccess({required this.todos});
}
