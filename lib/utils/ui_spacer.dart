import 'package:dlovera_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UiSpacer {
  //space between widgets vertically
  static Widget verticalSpace({double space = 20}) => SizedBox(height: space);

  //space between widgets horizontally
  static Widget horizontalSpace({double space = 20}) => SizedBox(width: space);

  static Widget formVerticalSpace({double space = 15}) =>
      SizedBox(height: space);

  static Widget emptySpace() => SizedBox.shrink();
  static Widget expandedSpace() => const Expanded(
    child: SizedBox.shrink(),
  );

  static Widget verticalDivider() => VxBox().color(AppColor.primaryColorDark).width(3).height(20).make().pOnly(right: Vx.dp8);
  static Widget divider() => VxBox().color(AppColor.primaryColorDark).width(20).height(3).make().pOnly(top: Vx.dp3);

}
