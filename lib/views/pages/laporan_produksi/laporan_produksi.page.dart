import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_produksi.vm.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi_sticky_content.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/widgets/report_statistic.widget.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/buttons/custom_floating_refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanProduksiPage extends StatefulWidget {
  const LaporanProduksiPage({Key? key}) : super(key: key);

  @override
  State<LaporanProduksiPage> createState() => _LaporanProduksiPageState();
}

class _LaporanProduksiPageState extends State<LaporanProduksiPage>
    with AutomaticKeepAliveClientMixin<LaporanProduksiPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<LaporanProduksiViewModel>.reactive(
        viewModelBuilder: () => LaporanProduksiViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, vm, child) {
          return CustomFloatingRefreshButton(
            onTap: () => vm.onReload(),
            child: SingleChildScrollView(
              child: VStack(
                [
                  UiSpacer.verticalSpace(),
                  HStack(
                    [
                      UiSpacer.verticalDivider(),
                      "Laporan Produksi".text.bold.size(20).make().expand(),
                      CustomButton(
                        height: 25,
                        title: "Pilih Bulan",
                        onPressed: () => vm.pickTheDate(context: context),
                      )
                    ],
                  ).px(14),
                  if (vm.selectedDate == null)
                    Container()
                  else
                    Column(
                      children: [
                        UiSpacer.verticalSpace(),
                        DateFormat()
                            .add_yMMM()
                            .format(vm.selectedDate!)
                            .text
                            .bold
                            .size(20)
                            .make()
                            .centered(),
                      ],
                    ),
                  UiSpacer.verticalSpace(),
                  vm.isBusy
                      ? const BusyIndicator().h(350).px(14)
                      : StatisticProduksiWidget(
                          dataChart: vm.dataChart!,
                          data: vm.laporanChartData,
                          vm: vm,
                        ).px(14),
                  UiSpacer.verticalSpace(space: Vx.dp24),
                  if (vm.laporanChartData != null)
                    vm.busy(vm.laporanPerBulanData)
                        ? Image.asset(AppImages.appLoadingGear).centered()
                        : StickyContentLaporanProduksi(
                            data: vm.laporanPerBulanData, vm: vm)
                  else
                    "Pilih bulan terlebih dahulu"
                        .text
                        .bold
                        .size(20)
                        .make()
                        .centered(),
                ],
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
