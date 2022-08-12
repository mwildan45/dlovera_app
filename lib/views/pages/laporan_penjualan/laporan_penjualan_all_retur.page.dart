import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPenjualanAllReturPage extends StatelessWidget {
  const LaporanPenjualanAllReturPage({Key? key, this.vm}) : super(key: key);
  final LaporanPenjualanViewModel? vm;

  @override
  Widget build(BuildContext context) {
    print('vm ${vm?.selectedMonth}');
    return BasePage(
      title: "Laporan Penjualan Semua Transaksi",
      body: ViewModelBuilder<LaporanPenjualanViewModel>.reactive(
          viewModelBuilder: () => LaporanPenjualanViewModel(context),
          onModelReady: (model) => model.onPageChangeAllRetur(1,
              month: vm?.selectedMonth, year: vm?.selectedYear),
          builder: (context, vm, child) {
            return VStack(
              [
                if (vm.busy(vm.laporanPenjualanReturDataSource))
                  Image.asset(AppImages.appLoadingGear).centered()
                else
                  SfDataGrid(
                    onQueryRowHeight: (details) {
                      return details.getIntrinsicRowHeight(details.rowIndex);
                    },
                    source: vm.laporanPenjualanReturDataSource!,
                    shrinkWrapRows: true,
                    columnWidthMode: ColumnWidthMode.fill,
                    verticalScrollPhysics: const BouncingScrollPhysics(),
                    columns: [
                      CustomGridColumn().gridColumn('noFaktur', 'No. Faktur'),
                      CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                      CustomGridColumn().gridColumn(
                          'namaCustomer', 'Nama Customer',
                          alignment: Alignment.centerLeft),
                      CustomGridColumn().gridColumn('namaBarang', 'Nama Barang',
                          alignment: Alignment.centerLeft),
                      CustomGridColumn().gridColumn('alasan', 'Alasan',
                          alignment: Alignment.centerLeft),
                    ],
                  ).expand(),
                CustomPaginationWidget(
                  currentPage: vm.currentPageRetur,
                  onPageChange: vm.onPageChangeAllRetur,
                  totalPage: vm.laporanPenjualanPerBulanData?.retur?.lastPage,
                )
              ],
            );
          }),
    );
  }
}
