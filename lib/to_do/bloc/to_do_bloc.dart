import 'package:bloc/bloc.dart';
import 'package:bloc_practice/to_do/model/todo_model.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(TodoInitial()) {
    on<AddButtonPressed>(_addButtonPressed);
    on<DeleteButtonPressed>(_deleteToDo);
  }

  Future<void> _addButtonPressed(
    AddButtonPressed event,
    Emitter<ToDoState> emit,
  ) async {
    List<TodoModel> currentTodos = [];

    if (state is TodoSuccess) {
      currentTodos = (state as TodoSuccess).todos;
    }
    emit(TodoLoading());
    await Future.delayed(const Duration(seconds: 5));

    // Step 1: get current list

    // Step 2: create new TodoModel from event
    final newTodo = TodoModel(
      id: event.id,
      title: event.title,
      description: event.description,
    );

    // Step 3: emit updated list as STATE

    emit(TodoSuccess(todos: [...currentTodos, newTodo]));
  }

  Future<void> _deleteToDo(
    DeleteButtonPressed event,
    Emitter<ToDoState> emit,
  ) async {
    List<TodoModel> currentList = [];

    if (state is TodoSuccess) {
      currentList = (state as TodoSuccess).todos;
    }

    final updateList = currentList
        .where((todo) => todo.id != event.id)
        .toList();

    emit(TodoSuccess(todos: updateList));
  }
}
