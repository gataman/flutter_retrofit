import 'package:api_project/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/todo_model/todo.dart';
import '../../../repository/todo_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(ListLoadingState());

  final _todoRepository = locator<TodoRepository>();
  List<Todo>? todoList;

  void getTodoList() async {
    todoList = await _todoRepository.getList();
    emit(ListLoadedState(todoList: todoList));
  }

  void getTodoById({required int id}) async {
    Todo? todo = await _todoRepository.getById(id);
    emit(TodoDetailState(todo: todo));
  }
}
