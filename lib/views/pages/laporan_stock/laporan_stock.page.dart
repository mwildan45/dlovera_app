import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock_sticky_content.dart';
import 'package:dlovera_app/widgets/buttons/custom_floating_refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockPage extends StatefulWidget {
  const LaporanStockPage({Key? key}) : super(key: key);

  @override
  State<LaporanStockPage> createState() => _LaporanStockPageState();
}

class _LaporanStockPageState extends State<LaporanStockPage>
    with AutomaticKeepAliveClientMixin<LaporanStockPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<LaporanStockViewModel>.reactive(
        viewModelBuilder: () => LaporanStockViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, vm, child) {
          return CustomFloatingRefreshButton(
            onTap: () => vm.initialise(),
            child: SingleChildScrollView(
              child: VStack(
                [
                  UiSpacer.verticalSpace(),
                  HStack(
                    [
                      UiSpacer.verticalDivider(),
                      "Laporan Stock".text.bold.size(20).make().expand()
                    ],
                  ).px(14),
                  // UiSpacer.verticalSpace(),
                  // vm.isBusy
                  //     ? const BusyIndicator().h(350).px(14)
                  //     : StatisticStockWidget(
                  //   dataChart: vm.dataChart!,
                  //   data: vm.laporanChartData,
                  //   vm: vm,
                  // ).px(14),
                  // UiSpacer.verticalSpace(space: Vx.dp24),
                  vm.isBusy
                      ? Image.asset(AppImages.appLoadingGear).centered()
                      : StickyContentLaporanStock(data: vm.stockData?.data, vm: vm),
                ],
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
