import 'dart:io';

import 'package:dlovera_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class MyBaseViewModel extends BaseViewModel {
  //
  BuildContext? viewContext;
  final currencySymbol = AppStrings.appCurrency;
  GlobalKey pageKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  void initialise() {

  }

  newPageKey() {
    pageKey = GlobalKey<FormState>();
    notifyListeners();
  }
}
