import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDoubleBoxContents extends StatelessWidget {
  const CustomDoubleBoxContents(
      {Key? key,
      required this.firstContent,
      required this.secondContent,
      this.busyIndicator = false,
      this.heightBox = 108})
      : super(key: key);
  final Widget firstContent, secondContent;
  final double heightBox;
  final bool busyIndicator;

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        busyIndicator
            ? const BusyIndicator().h(heightBox).expand()
            : Container(
                decoration: BoxStyles.boxContent(),
                child: VStack(
                  [
                    UiSpacer.verticalSpace(space: Vx.dp3),
                    firstContent.expand(),
                    UiSpacer.verticalSpace(space: Vx.dp3),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ).h(heightBox).expand(),
        UiSpacer.horizontalSpace(space: Vx.dp12),
        busyIndicator
            ? const BusyIndicator().h(heightBox).expand()
            : Container(
                decoration: BoxStyles.boxContent(),
                child: VStack(
                  [
                    UiSpacer.verticalSpace(space: Vx.dp3),
                    secondContent.expand(),
                    UiSpacer.verticalSpace(space: Vx.dp3),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ).h(heightBox).expand(),
      ],
    );
  }
}
