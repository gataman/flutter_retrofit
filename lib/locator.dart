import 'package:api_project/core/network/dio_client.dart';
import 'package:api_project/core/network/rest_client.dart';
import 'package:get_it/get_it.dart';

import 'constants/constants.dart';
import 'repository/todo_repository.dart';

final locator = GetIt.I;

Future initLocator() async {
  final dio = buildDioClient(baseUrl: BASE_URL);
  locator.registerLazySingleton<RestClient>(() => RestClient(dio));

  //Repositories:
  locator.registerLazySingleton(() => TodoRepository());
}
