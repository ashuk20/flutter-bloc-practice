import 'package:bloc_practice/api_example/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersBloc()..add(LoadUsers()),
      child: UserView(),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UsersFailure) {
            return Center(child: Text(state.error));
          }
          if (state is UsersSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<UsersBloc>();
                bloc.add(PullToRefresh());
                await bloc.stream.firstWhere(
                  (state) => state is UsersSuccess || state is UsersFailure,
                );
              },

              child: ListView.builder(
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(user.name[0])),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
                itemCount: state.users.length,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
