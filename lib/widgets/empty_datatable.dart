import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyDatatable extends StatelessWidget {
  const EmptyDatatable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiSpacer.verticalSpace(),
        Image.asset(AppImages.appDataSearch).w(200).centered(),
        UiSpacer.verticalSpace(),
        "Tidak ada data dalam tabel ini".text.bold.make().centered()
      ],
    );
  }
}
