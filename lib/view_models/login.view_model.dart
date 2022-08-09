import 'package:cool_alert/cool_alert.dart';
import 'package:dlovera_app/constants/app_routes.dart';
import 'package:dlovera_app/models/api_response.dart';
import 'package:dlovera_app/requests/auth.request.dart';
import 'package:dlovera_app/services/auth.service.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginViewModel extends MyBaseViewModel {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final AuthRequest _authRequest = AuthRequest();

  LoginViewModel(BuildContext context){
    viewContext = context;
  }

  void initialise(){
    // loadNextPage();
  }

  void processLogin() async {
    // Validate returns true if the form is valid, otherwise false.
    if (formKey.currentState!.validate()) {
      //

      setBusy(true);

      final apiResponse = await _authRequest.loginRequest(
        username: username.text,
        password: password.text,
      );

      print('api ${apiResponse.body['token']}');

      await handleDeviceLogin(apiResponse);

      setBusy(false);

    }
  }

  handleDeviceLogin(ApiResponse apiResponse) async {
    try {
      if (apiResponse.body['status'] != 'success') {
        //there was an error
        CoolAlert.show(
          context: viewContext!,
          type: CoolAlertType.error,
          title: "Login Failed",
          text: apiResponse.message,
        );
      } else {
        //everything works well
        await AuthServices.saveUser(apiResponse.body);
        await AuthServices.setAuthBearerToken(apiResponse.body["token"]);
        await AuthServices.isAuthenticated();
        viewContext?.navigator?.pushNamedAndRemoveUntil(
          AppRoutes.homeRoute,
              (route) => false,
        );
      }
    } catch (error) {
      CoolAlert.show(
        context: viewContext!,
        type: CoolAlertType.error,
        title: "Login Failed",
        text: "$error",
      );
    }
  }

  loadNextPage() async {
    print('authenticate ${AuthServices.authenticated()}');
    Future.delayed(const Duration(seconds: 2), () {
      if (!AuthServices.authenticated()) {
        viewContext?.navigator?.pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);
      } else {
        viewContext?.navigator?.pushNamedAndRemoveUntil(AppRoutes.homeRoute, (route) => false);
      }
    });
  }

}