import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/sticky_content.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/widgets/report_statistic.widget.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPenjualanPage extends StatefulWidget {
  const LaporanPenjualanPage({Key? key}) : super(key: key);

  @override
  State<LaporanPenjualanPage> createState() => _LaporanPenjualanPageState();
}

class _LaporanPenjualanPageState extends State<LaporanPenjualanPage>
    with AutomaticKeepAliveClientMixin<LaporanPenjualanPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<LaporanPenjualanViewModel>.reactive(
        viewModelBuilder: () => LaporanPenjualanViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, vm, child) {
          return SingleChildScrollView(
            child: VStack(
              [
                UiSpacer.verticalSpace(),
                HStack(
                  [
                    UiSpacer.verticalDivider(),
                    "Laporan Penjualan".text.bold.size(20).make().expand()
                  ],
                ).px(14),
                UiSpacer.verticalSpace(),
                vm.isBusy
                    ? const BusyIndicator().h(350).px(14)
                    : StatisticPenjualanWidget(
                        dataChart: vm.dataChart!,
                        data: vm.laporanPenjualanData,
                        vm: vm,
                      ).px(14),
                UiSpacer.verticalSpace(space: Vx.dp24),
                vm.busy(vm.laporanPenjualanPerBulanData) || vm.laporanPenjualanData == null
                    ? Image.asset(AppImages.appLoadingGear).centered()
                    : StickyContentLaporanPenjualan(data: vm.laporanPenjualanPerBulanData, vm: vm),
              ],
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
