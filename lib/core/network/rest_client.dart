import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/todo_model/todo.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  //Todo endpoints
  @GET("/todos")
  Future<List<Todo>?> getTodoList();

  @GET("/todos/{id}")
  Future<Todo?> getTodo(@Path("id") int id);
}
