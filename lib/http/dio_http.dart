import 'package:dio/dio.dart';
import 'package:first_demo/http/http_method.dart';

class DioHttp{
  static DioHttp? _dioHttpInstance;

  DioHttp._();

  static DioHttp instance(){
    return _dioHttpInstance ??= DioHttp._();
  }

  final Dio _dio = Dio();

  void initDio(String baseUrl, {
    String? method = HttpMethod.get,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }){
    _dio.options = BaseOptions(
      method: method,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      responseType: responseType,
      contentType: contentType
    );
  }

  Future<Response> get(String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken
  })async{
    return _dio.get(
      path,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken
    );
  }

  Future<Response> post(String path, {
    Object? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken
  })async{
    return _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken
    );
  }
}