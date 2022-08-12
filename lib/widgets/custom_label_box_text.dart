import 'package:dlovera_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomLabelBoxText extends StatelessWidget {
  const CustomLabelBoxText({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Vx.dp20, vertical: Vx.dp5),
        decoration: BoxDecoration(
          color: AppColor.primaryColorDark,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: label.text.xl.bold.white.make(),
      ),
    );
  }
}
