import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/services/validator.service.dart';
import 'package:dlovera_app/view_models/login.view_model.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          noAppBar: true,
          isLoading: model.isBusy,
          body: SafeArea(
            top: true,
            bottom: false,
            child: VStack(
              [
                Image.asset(
                  AppImages.appLogo,
                ).hOneForth(context).centered(),
                //
                VStack(
                  [
                    //
                    "Selamat Datang".text.xl2.semiBold.make(),
                    "Silahkan masuk untuk melanjutkan".text.light.make(),

                    //form
                    Form(
                      key: model.formKey,
                      child: VStack(
                        [
                          //
                          CustomTextFormField(
                            labelText: "Username",
                            keyboardType: TextInputType.emailAddress,
                            textEditingController: model.username,
                            validator: FormValidator.validateName,
                          ).py12(),
                          CustomTextFormField(
                            labelText: "Password",
                            obscureText: true,
                            textEditingController: model.password,
                            validator: FormValidator.validatePassword,
                          ).py12(),

                          //
                          CustomButton(
                            title: "Login",
                            loading: model.isBusy,
                            onPressed: model.processLogin,
                          ).centered().py12(),

                        ],
                        crossAlignment: CrossAxisAlignment.end,
                      ),
                    ).py20(),
                  ],
                )
                    .wFull(context)
                    .p20()
                    .scrollVertical()
                    .box
                    .color(context.cardColor)
                    .make()
                    .expand(),

                //
              ],
            ).pOnly(
              bottom: context.mq.viewInsets.bottom,
            ),
          ),
        );
      },
    );
  }
}
