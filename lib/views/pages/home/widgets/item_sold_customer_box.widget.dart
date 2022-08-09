import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:dlovera_app/widgets/box_contents/custom_double_box_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemSoldCustomerBox extends StatelessWidget {
  const ItemSoldCustomerBox(
      {Key? key,
      required this.itemSold,
      required this.customer,
      this.busyIndicator = false})
      : super(key: key);

  final ItemSold? itemSold;
  final Customer? customer;
  final bool busyIndicator;

  @override
  Widget build(BuildContext context) {
    return CustomDoubleBoxContents(
      busyIndicator: busyIndicator,
      firstContent: VStack(
        [
          TextStyles.labelBoxText(label: "Total Item Sold"),
          UiSpacer.divider(),
          "${itemSold?.total}"
              .text
              .bold
              .size(Vx.dp32)
              .make()
              .centered(),
          HStack([
            SvgPicture.asset(AppSvgs.downward).pOnly(right: Vx.dp5),
            Flexible(
              child: "${itemSold?.percent}% from yesterday"
                  .text.overflow(TextOverflow.visible)
                  .color(AppColor.sizzlingRed)
                  .sm
                  .make(),
            )
          ]),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
      secondContent: VStack(
        [
          TextStyles.labelBoxText(label: "Total Customer"),
          UiSpacer.divider(),
          "${customer?.total}"
              .text
              .bold
              .size(Vx.dp32)
              .make()
              .centered(),
          HStack([
            SvgPicture.asset(AppSvgs.upward).pOnly(right: Vx.dp5),
            Flexible(
              child: "${customer?.percent}% from yesterday"
                  .text.overflow(TextOverflow.visible)
                  .color(AppColor.green)
                  .sm
                  .make(),
            )
          ]),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
