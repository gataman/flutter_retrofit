import 'package:api_project/locator.dart';

import '../core/network/rest_client.dart';
import '../model/todo_model/todo.dart';

class TodoRepository {
  final _client = locator<RestClient>();

  Future<List<Todo>?> getList() => _client.getTodoList();
  Future<Todo?> getById(id) => _client.getTodo(id);
}
