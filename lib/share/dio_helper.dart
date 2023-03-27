import 'package:dio/dio.dart';
import 'package:elhamdania/componant/const.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 40), // 60 seconds
        receiveTimeout:Duration(seconds: 40) ,
        
        baseUrl: 'https://hamdania.online/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // post
  static Future<Response> postData({
    required String path,
    String? token,
    required dynamic data,
    // Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      //  'Content-type': 'multipart/form-data'
    };
    return await dio.post(
      path,
      data: data,
      //  queryParameters: data
    );
  }

  //get
  static Future<Response> getData({
    required String path,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
    };

    return await dio.get(path, queryParameters: query);
  }

  //put
  static Future<Response> putData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.put(path!, data: data, queryParameters: query);
  }

  static Future<Response> patchData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.patch(path!, data: data, queryParameters: query);
  }

  //delete
  static Future<Response> deleteData({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      "Authorization": "Bearer $token",
    };
    return await dio.delete(path!, data: data, queryParameters: query);
  }

  
}
