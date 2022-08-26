import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_pembelian.vm.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian_sticky_content.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/widgets/report_statistic.widget.dart';
import 'package:dlovera_app/widgets/busy_indicator.dart';
import 'package:dlovera_app/widgets/buttons/custom_floating_refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPembelianPage extends StatefulWidget {
  const LaporanPembelianPage({Key? key}) : super(key: key);

  @override
  State<LaporanPembelianPage> createState() => _LaporanPembelianPageState();
}

class _LaporanPembelianPageState extends State<LaporanPembelianPage>
    with AutomaticKeepAliveClientMixin<LaporanPembelianPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<LaporanPembelianViewModel>.reactive(
        viewModelBuilder: () => LaporanPembelianViewModel(context),
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
                      "Laporan Pembelian".text.bold.size(20).make().expand()
                    ],
                  ).px(14),
                  UiSpacer.verticalSpace(),
                  vm.isBusy
                      ? const BusyIndicator().h(350).px(14)
                      : StatisticPembelianWidget(
                    dataChart: vm.dataChart!,
                    data: vm.laporanChartData,
                    vm: vm,
                  ).px(14),
                  UiSpacer.verticalSpace(space: Vx.dp24),
                  vm.busy(vm.laporanPerBulanData) || vm.laporanChartData == null
                      ? Image.asset(AppImages.appLoadingGear).centered()
                      : StickyContentLaporanPembelian(data: vm.laporanPerBulanData, vm: vm),
                ],
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
