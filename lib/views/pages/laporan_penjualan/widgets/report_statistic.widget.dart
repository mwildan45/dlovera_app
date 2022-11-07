import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/models/chart_data.model.dart';
import 'package:dlovera_app/models/laporan.model.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/custom_label_box_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class StatisticPenjualanWidget extends StatefulWidget {
  const StatisticPenjualanWidget(
      {Key? key, required this.data, required this.dataChart, required this.vm})
      : super(key: key);

  final LaporanChartData? data;
  final List<ChartData> dataChart;
  final LaporanPenjualanViewModel vm;

  @override
  State<StatisticPenjualanWidget> createState() =>
      _StatisticPenjualanWidgetState();
}

class _StatisticPenjualanWidgetState extends State<StatisticPenjualanWidget> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxStyles.boxContent(),
          child: SfCartesianChart(
            isTransposed: true,
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: widget.data?.max?.toDouble(),
              numberFormat: NumberFormat.compactCurrency(locale: 'id'),
            ),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    // overflowMode: OverflowMode.shift,
                    // labelPosition: ChartDataLabelPosition.outside,
                    labelAlignment: ChartDataLabelAlignment.outer,
                    textStyle: TextStyle(color: Colors.black),
                  ),
                  dataSource: widget.dataChart,
                  xValueMapper: (ChartData data, _) => data.num.toString(),
                  yValueMapper: (ChartData data, _) => double.parse(data.y),
                  name: 'Laporan Penjualan Statistic',
                  color: AppColor.primaryColorDark,
                  onPointTap: (ChartPointDetails data) {
                    final id = widget
                        .vm.laporanChartData?.statistic?[data.pointIndex!].num;
                    print(
                        '${widget.vm.laporanChartData?.statistic?[data.pointIndex!].num}');
                    widget.vm.getLaporanPenjualanPerBulan(widget.vm.selectedMonth,
                        (widget.vm.selectedYear ?? widget.data?.yearNow), id.toString());
                  })
            ],
          ).pOnly(top: Vx.dp48),
        ).w(double.maxFinite).h(380),
        const CustomLabelBoxText(label: "Statistik"),
        // Positioned(
        //   top: 5,
        //   right: 8,
        //   child: Column(
        //     children: [
        //       if (widget.vm.selectedDate == null)
        //         const Text('No month year selected.')
        //       else
        //         Text(DateFormat().add_yM().format(widget.vm.selectedDate!)),
        //       // DropdownButtonFormField<dynamic>(
        //       //   isExpanded: true,
        //       //   isDense: true,
        //       //   decoration:
        //       //       const InputDecoration.collapsed(hintText: "Pilih Tahun"),
        //       //   value: (widget.vm.selectedYear ?? widget.data?.yearNow).toString(),
        //       //   onChanged: (value) {
        //       //     widget.vm.selectedYear = value;
        //       //     widget.vm.getLaporanPenjualanChart(value.toString());
        //       //     widget.vm.notifyListeners();
        //       //   },
        //       //   items: widget.data?.yearList?.map(
        //       //     (e) {
        //       //       return DropdownMenuItem(
        //       //           value: e.year.toString(), child: Text("${e.year}"));
        //       //     },
        //       //   ).toList(),
        //       // )
        //       //     .p8()
        //       //     .w(100)
        //       //     .h(40)
        //       //     .box
        //       //     .border(color: AppColor.fadedGrey)
        //       //     .roundedLg
        //       //     .make()
        //       //     .py4(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
