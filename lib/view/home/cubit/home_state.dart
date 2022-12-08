part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class ListLoadingState extends HomeState {}

class ListLoadedState extends HomeState {
  final List<Todo>? todoList;

  ListLoadedState({required this.todoList});
}

class TodoDetailState extends HomeState {
  final Todo? todo;

  TodoDetailState({required this.todo});
}
