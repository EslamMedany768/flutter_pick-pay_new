import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import 'api_constants.dart';

@singleton
class ApiManager {
  var dio = Dio();

  Future<Response> getData({
    required endPoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return dio.get(
      ApiConstants.baseUrl + endPoint,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData({
    required endPoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> deleteData({required endPoint,
    required String productId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      "${ApiConstants.baseUrl + endPoint}/$productId",
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> updateData({required endPoint,
    required String productId,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,required int count
  }) {
    return dio.put(
      "${ApiConstants.baseUrl + endPoint}/$productId",
      queryParameters: queryParameters,
      data: {
        "count":"$count"
      },
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
