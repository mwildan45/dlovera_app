import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/services/auth.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.service.dart';

class HttpService {
  String host = Api.baseUrl;
  Dio dio = Dio();
  SharedPreferences? prefs;

  Future<Map<String, String>> getHeaders() async {
    final userToken = await AuthServices.getAuthBearerToken();
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $userToken",
    };
  }

  //for get api calls
  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool includeHeaders = true,
  }) async {
    //preparing the api uri/url
    String uri = "$host$url";

    //preparing the post options if header is required
    final mOptions = !includeHeaders
        ? null
        : Options(
            headers: await getHeaders(),
          );

    return dio.get(
      uri,
      options: mOptions,
      queryParameters: queryParameters,
    );
  }

  Response formatDioException(DioError ex) {
    Response response = Response(requestOptions: ex.requestOptions);
    response.statusCode = 400;
    try {
      if (ex.type == DioErrorType.connectTimeout) {
        response.data = {
          "message":
              "Connection timeout. Please check your internet connection and try again",
        };
      } else {
        response.data = {
          "message": ex.message,
        };
      }
    } catch (error) {
      response.statusCode = 400;
      response.data = {
        "message": error.toString(),
      };
    }

    return response;
  }
}
