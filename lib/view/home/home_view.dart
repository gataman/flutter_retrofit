import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/todo_model/todo.dart';
import 'cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  int currentId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 32,
            ),
            _buttons(context),
            const Divider(),
            _states(),
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().getTodoList();
          },
          child: const Text('Get All Todos'),
        ),
        ElevatedButton(
          onPressed: () {
            _goNextTodo(context);
          },
          child: const Text('Get todo by id'),
        )
      ],
    );
  }

  Widget _states() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ListLoadedState) {
          return _listLoadedState(state.todoList, context);
        } else if (state is TodoDetailState) {
          return _todoDetailState(state.todo, context);
        } else {
          return _listLoadingState();
        }
      },
    );
  }

  Widget _listLoadingState() {
    return const SizedBox(child: CircularProgressIndicator());
  }

  Widget _listLoadedState(List<Todo>? todoList, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (todoList != null && todoList.isNotEmpty) {
      return SizedBox(
        height: height * .7,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: .5,
            height: 0,
            indent: .1,
          ),
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                child: ListTile(
                  title: Text(todo.title ?? ''),
                ),
              ),
            );
          },
          itemCount: todoList.length,
        ),
      );
    } else {
      return const Center(
        child: Text('The list is empty!'),
      );
    }
  }

  Widget _todoDetailState(Todo? todo, BuildContext context) {
    if (todo != null) {
      return Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text('ID : ${todo.id}'),
                Text('Title : ${todo.title}'),
                Text('UserID : ${todo.userId}'),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    onPressed: () {
                      currentId++;
                      _goNextTodo(context);
                    },
                    icon: const Icon(Icons.skip_next),
                    label: const Text('Next'))
              ],
            ),
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('Something went wrong!'),
      );
    }
  }

  void _goNextTodo(BuildContext context) {
    context.read<HomeCubit>().getTodoById(id: currentId);
  }
}
