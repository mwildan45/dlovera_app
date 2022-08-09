import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/services/http.service.dart';
import 'package:flutter/material.dart';

class AuthRequest extends HttpService {
  //
  Future<ApiResponse> loginRequest({
    required String username,
    required String password,
  }) async {
    final apiResult = await post(
      Api.login,
      {
        "username": username,
        "password": password
      },
    );

    return ApiResponse.fromResponse(apiResult, hasDataObject: false);
  }
}