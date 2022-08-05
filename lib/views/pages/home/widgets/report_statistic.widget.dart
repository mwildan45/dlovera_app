import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/chart_data.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class ReportStatistic extends StatefulWidget {
  const ReportStatistic(
      {Key? key,
      required this.statistic,
      required this.dataChart})
      : super(key: key);

  final Statistic? statistic;
  final List<ChartData> dataChart;

  @override
  State<ReportStatistic> createState() => _ReportStatisticState();
}

class _ReportStatisticState extends State<ReportStatistic> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp3),
          TextStyles.labelBoxText(label: "Report Statistic").centered(),
          UiSpacer.divider().centered(),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  minimum: 0, maximum: widget.statistic?.max?.toDouble()),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                    dataSource: widget.dataChart,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => double.parse(data.y),
                    name: 'Report Statistic',
                    color: AppColor.primaryColorDark)
              ])
        ],
      ),
    );
  }
}
