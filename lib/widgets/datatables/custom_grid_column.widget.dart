import 'package:dlovera_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomGridColumn {
  GridColumn gridColumn(String columnName, String label,
      {Alignment alignment = Alignment.center}) {
    return GridColumn(
      columnName: columnName,
      label: Container(
        color: AppColor.primaryColorDark,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: alignment,
        child: label.text.white.align(TextAlign.center).medium.make(),
      ),
    );
  }
}
