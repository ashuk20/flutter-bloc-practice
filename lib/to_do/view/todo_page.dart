import 'package:bloc_practice/to_do/bloc/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(),
      child: const ToDoView(),
    );
  }
}

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TO DO")),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is TodoSuccess) {
            if (state.todos.isEmpty) {
              return Center(child: Text("No todos ye. Tap + to add. "));
            }

            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (cotext, index) {
                final todo = state.todos[index];
                return Card(
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ToDoBloc>().add(
                          DeleteButtonPressed(id: todo.id),
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No todos ye. Tap + to add. "));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ToDoBloc>(),
                child: const AddTodoPage(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titileController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titileController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titileController.text.isEmpty) return;
                  context.read<ToDoBloc>().add(
                    AddButtonPressed(
                      id: DateTime.now().microsecond,
                      title: titileController.text,
                      description: descriptionController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
