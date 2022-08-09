import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/login.view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (model) => model.loadNextPage(),
      builder: (context, model, child) {
        return Center(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: AppColor.primaryColorDark,
            child: Image.asset(AppImages.appBanner),
          ),
        );
      },
    );
  }
}
