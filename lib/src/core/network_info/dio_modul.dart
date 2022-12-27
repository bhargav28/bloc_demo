import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {

  @preResolve
  @Environment("development")
  Future<Dio> getDioDev() async {
    return _getDio("https://jsonplaceholder.typicode.com");
  }

  Future<Dio> _getDio(String baseUrl) async {

    final prettyDioLogger = PrettyDioLogger();
    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
      headers: {
        "accept": "application/json",
      }
    );

    return Dio(options)..interceptors.addAll([
      prettyDioLogger,
    ]);
  }
}