import 'package:dio/dio.dart' as doi;
import 'package:cat_facts_flutter/core/constant/constant.dart';
import 'package:cat_facts_flutter/core/models/api_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as doi;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class HttpConnection {
  // dio init
  Dio _dio() {
    final options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(milliseconds: 20000),
      baseUrl: baseURL,
      contentType: "application/json",
      validateStatus: (status) {
        return status! < 499;
      },
    );
    var dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    ));

    return dio;
  }

  Dio get dio => _dio();

  var headers = {
    'Accept': 'application/json',
  };

  //if pure == true, it will return data without parsing it into ApiResponseModel
  Future<dynamic> get(String url,
      {Map<String, String>? params, bool pure = false}) async {
    doi.Response resp = await dio.get(url,
        queryParameters: params, options: Options(headers: headers));

    if (resp.statusCode != null) {
      if (pure) return resp;
      if (resp.data != null) {
        if (resp.data is List) {
          // Return the list directly if it's a list
          return resp.data;
        } else if (resp.data is Map<String, dynamic>) {
          // Parse into ApiResponseModel if it's a map
          return ApiResponseModel.fromJson(resp.data);
        }
      }
    }

    return null; // Handle this as per your application's error handling strategy
  }
}
