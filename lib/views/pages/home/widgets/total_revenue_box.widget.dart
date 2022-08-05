import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/constants/app_strings.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:dlovera_app/widgets/custom_label_box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalRevenueBox extends StatelessWidget {
  const TotalRevenueBox(
      {Key? key,
      required this.totalRevenue,
      required this.yesterdayTotalRevenue,
      required this.percentage,
      this.busyIndicator = false})
      : super(key: key);
  final String totalRevenue, yesterdayTotalRevenue;
  final double percentage;
  final bool busyIndicator;

  @override
  Widget build(BuildContext context) {
    return busyIndicator
        ? const BusyIndicator().h(140)
        : Stack(
            children: [
              Container(
                decoration: BoxStyles.boxContent(),
                child: HStack(
                  [
                    AppStrings.appCurrency.text
                        .size(Vx.dp16)
                        .make()
                        .centered()
                        .pOnly(bottom: 18, right: Vx.dp4),
                    totalRevenue.text.bold.size(Vx.dp32).make().centered()
                  ],
                  crossAlignment: CrossAxisAlignment.stretch,
                  alignment: MainAxisAlignment.center,
                ),
              ).w(double.maxFinite).h(140),
              const CustomLabelBoxText(label: "Total Revenue"),
              Positioned(
                bottom: 5,
                right: 8,
                child: HStack([
                  SvgPicture.asset(AppSvgs.upward).pOnly(right: Vx.dp5),
                  "$percentage% from yesterday"
                      .text
                      .color(AppColor.green)
                      .lg
                      .make()
                ]),
              )
            ],
          );
  }
}
