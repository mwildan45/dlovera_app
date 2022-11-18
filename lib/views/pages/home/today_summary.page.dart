import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/today_summary.vm.dart';
import 'package:dlovera_app/views/pages/home/widgets/item_sold_customer_box.widget.dart';
import 'package:dlovera_app/views/pages/home/widgets/report_statistic.widget.dart';
import 'package:dlovera_app/views/pages/home/widgets/table_latest_transactions.widget.dart';
import 'package:dlovera_app/views/pages/home/widgets/total_revenue_box.widget.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/buttons/custom_floating_refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class TodaySummaryPage extends StatefulWidget {
  const TodaySummaryPage({Key? key, required this.pageViewController})
      : super(key: key);
  final PageController pageViewController;

  @override
  State<TodaySummaryPage> createState() => _TodaySummaryPageState();
}

class _TodaySummaryPageState extends State<TodaySummaryPage>
    with AutomaticKeepAliveClientMixin<TodaySummaryPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<TodaySummaryViewModel>.reactive(
        viewModelBuilder: () => TodaySummaryViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, vm, child) {
          return CustomFloatingRefreshButton(
            onTap: () => vm.initialise(),
            child: SingleChildScrollView(
              child: VStack([
                UiSpacer.verticalSpace(),
                "Rekap Harian".text.bold.size(20).make().centered(),
                UiSpacer.divider().centered(),
                UiSpacer.verticalSpace(
                  space: 8,
                ),
                CustomButton(
                  child: (vm.selectedTgl == null ? "Pilih Tanggal" : "${vm.selectedTgl!.day}-${vm.selectedTgl!.month}-${vm.selectedTgl!.year}").text.bold.make().centered(),
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2010, 1, 1),
                        maxTime: DateTime(2030, 12, 31), onChanged: (date) {
                      print('change $date');
                    },
                        onConfirm: vm.onTglSelected,
                        currentTime: DateTime.now(),
                        locale: LocaleType.id);
                  },
                ).w40(context).h4(context).centered(),
                UiSpacer.verticalSpace(),
                TotalRevenueBox(
                  totalRevenue: vm.todaySummaryData?.totalRevenue?.total ?? 0,
                  percentage: vm.todaySummaryData?.totalRevenue?.percent ?? 0,
                  yesterdayTotalRevenue:
                      vm.todaySummaryData?.totalRevenue?.yesterdayData ?? 0,
                  busyIndicator: vm.isBusy,
                ),
                UiSpacer.verticalSpace(space: Vx.dp12),
                ItemSoldCustomerBox(
                  customer: vm.todaySummaryData?.customer,
                  itemSold: vm.todaySummaryData?.itemSold,
                  busyIndicator: vm.isBusy,
                ),
                UiSpacer.verticalSpace(space: Vx.dp12),
                vm.isBusy
                    ? const BusyIndicator().h(200)
                    : ReportStatistic(
                        dataChart: vm.dataChart,
                        statistic: vm.todaySummaryData?.statistic,
                      ),
                UiSpacer.verticalSpace(space: Vx.dp12),
                vm.isBusy
                    ? const BusyIndicator().h(200)
                    : TableLatestTransaction(
                        todaySummaryData: vm.todaySummaryData,
                        onPressed: () =>
                            vm.seeAllTransactionsNav(widget.pageViewController),
                      ),
                UiSpacer.verticalSpace(space: Vx.dp12),
              ]).px(14),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
