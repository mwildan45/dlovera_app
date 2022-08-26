import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
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
          TextStyles.labelBoxText(label: "Total Produk"),
          UiSpacer.divider(),
          "${itemSold?.total}"
              .text
              .bold
              .size(Vx.dp32)
              .make()
              .centered(),
          HStack([
            SvgPicture.asset((itemSold?.total ?? 0) < (itemSold?.yesterdayData ?? 0) ? AppSvgs.downward : AppSvgs.upward).pOnly(right: Vx.dp5),
            Flexible(
              child: "${itemSold?.percent}% from previous"
                  .text.overflow(TextOverflow.visible)
                  .color((itemSold?.total ?? 0) < (itemSold?.yesterdayData ?? 0) ? AppColor.sizzlingRed : AppColor.green)
                  .sm
                  .make(),
            )
          ]),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
      secondContent: VStack(
        [
          TextStyles.labelBoxText(label: "Total Konsumen"),
          UiSpacer.divider(),
          "${customer?.total}"
              .text
              .bold
              .size(Vx.dp32)
              .make()
              .centered(),
          HStack([
            SvgPicture.asset((customer?.total ?? 0) < (customer?.yesterdayData ?? 0) ? AppSvgs.downward : AppSvgs.upward).pOnly(right: Vx.dp5),
            Flexible(
              child: "${customer?.percent}% from previous"
                  .text.overflow(TextOverflow.visible)
                  .color((customer?.total ?? 0) < (customer?.yesterdayData ?? 0) ? AppColor.sizzlingRed : AppColor.green)
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
