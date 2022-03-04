import 'package:dio/dio.dart';

class MyDio {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, String>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang':'ar',
      'Authorization': token

    };
    return await dio!.get(url,queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic>? body,
    Map<String, String>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'ar',
      // 'Authorization': token,
    };

    return await dio!.post(url, data: body, queryParameters: query);
  }
}
