import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio;
  static dioInit() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://librarypdf.tagalqemma.com/api/',
          receiveDataWhenStatusError: true,
        ),
    );
  }

  static Future<Response<dynamic>> getData({
     String url,
    Map<dynamic, dynamic> query,

  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',

    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response<dynamic>> postData(
      { String url,
      Map<String, dynamic> query,
      String token,
       Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',

     };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response<dynamic>> updateData(
      { String url,
        Map<String, dynamic> query,
        String lang = 'en',
        String token,
         Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization' : token!=null?token:'',
    };
    return await dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

}
