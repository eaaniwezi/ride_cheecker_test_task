// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, unnecessary_null_comparison, avoid_renaming_method_parameters
import 'package:dio/dio.dart';

class IApiClass extends IApi {
  @override
  Future<Response<T>> delete<T>(String path) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> get<T>(
      String baseUrl, Map<String, dynamic>? queryParameters) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patch<T>(
      String path, Map? data, Map<String, dynamic>? queryParameters) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> post<T>(
      String path, Map? data, Map<String, dynamic>? queryParameters) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(
      String path, Map? data, Map<String, dynamic>? queryParameters) {
    throw UnimplementedError();
  }
}

abstract class IApi {
  Future<Response<T>> get<T>(
      String baseUrl, Map<String, dynamic>? queryParameters);
  Future<Response<T>> post<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters);
  Future<Response<T>> put<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters);
  Future<Response<T>> patch<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters);
  Future<Response<T>> delete<T>(String path);
}

class Api extends IApi {
  final Dio api = Dio();

  Api() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('https')) {
        options.path = 'https://bibiptrip.com' + options.path;
      }

      return handler.next(options);
    }, onError: (DioError error, handler) async {
      try {
        if ((error.response?.statusCode == 401 ||
            error.response?.data['message'] == "Unauthorized")) {
          return handler.resolve(await _retry(error.requestOptions));
        }
        print(error.response!.data);
        print(error.response!.statusCode);
      } catch (e) {
        print(e);
      }
      return handler.next(error);
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }

  @override
  Future<Response<T>> get<T>(
      String path, Map<String, dynamic>? queryParameters) {
    return api.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> post<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters) {
    return api.post(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> put<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters) {
    return api.put(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> patch<T>(String path, Map<dynamic, dynamic>? data,
      Map<String, dynamic>? queryParameters) {
    return api.patch(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> delete<T>(String path) {
    return api.delete(path);
  }
}
