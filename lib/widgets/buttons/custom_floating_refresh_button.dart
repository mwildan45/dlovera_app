import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomFloatingRefreshButton extends StatelessWidget {
  const CustomFloatingRefreshButton({Key? key, required this.child, this.onTap})
      : super(key: key);
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      noAppBar: true,
      floatingActionWidget: CustomButton(
        icon: Icons.refresh,
        elevation: 8,
        color: AppColor.primaryColorDark,
        // iconColor: A,
        onPressed: onTap,
        shape: const CircleBorder(),
      ).w(68),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: child,
    );
  }
}
