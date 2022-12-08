import 'package:dio/dio.dart';

Dio buildDioClient({required String baseUrl}) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);

  /*
  dio.interceptors.addAll(
    [
      TokenInterceptor(),
      DialogInterceptor(),
      ...
    ]
  );
  */

  return dio;
}
