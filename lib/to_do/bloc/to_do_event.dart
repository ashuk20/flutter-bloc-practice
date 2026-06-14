part of 'to_do_bloc.dart';

abstract class ToDoEvent {}

class AddButtonPressed extends ToDoEvent {
  final int id;
  final String title;
  final String description;

  AddButtonPressed({
    required this.id,
    required this.title,
    required this.description,
  });
}

class DeleteButtonPressed extends ToDoEvent {
  final int id;

  DeleteButtonPressed({required this.id});
}

class ToggleTodoCompleted extends ToDoEvent {
  final int id;
  ToggleTodoCompleted({required this.id});
}
