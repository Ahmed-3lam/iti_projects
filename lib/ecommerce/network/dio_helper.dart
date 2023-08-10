import 'package:dio/dio.dart';

class DioHelper {
  static String token = "";
  static Dio? dio;
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    if (token.isNotEmpty) "Authorization": token,
  };

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        responseType: ResponseType.json,
        headers: headers,
      ),
    );
  }

  /// Post

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response =
        await dio!.post(url, data: body, queryParameters: queryParams);

    return response;
  }

  /// Get
  Future<Response> getData({
    String? image,
    required String url,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio!.get(url, data: body);

    return response;
  }

  /// Put

  /// Patch

  /// Delete
}
