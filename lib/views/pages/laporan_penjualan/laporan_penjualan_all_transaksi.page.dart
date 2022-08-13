import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPenjualanAllTransaksiPage extends StatelessWidget {
  const LaporanPenjualanAllTransaksiPage({Key? key, this.viewModel})
      : super(key: key);
  final LaporanPenjualanViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanPenjualanViewModel>.reactive(
      viewModelBuilder: () => LaporanPenjualanViewModel(context),
      onModelReady: (model) => model.onPageChangeAllTransaksi(1,
          month: viewModel?.selectedMonth, year: viewModel?.selectedYear),
      builder: (context, vm, child) {
        return BasePage(
          title:
              "Laporan Penjualan Transaksi ${vm.laporanPerBulanData?.month} ${vm.laporanPerBulanData?.year}",
          // floatingActionWidget: ,
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          body: VStack(
            [
              if (vm.busy(vm.laporanPenjualanTransaksiDataSource))
                Image.asset(AppImages.appLoadingGear).centered()
              else
                SfDataGrid(
                  onQueryRowHeight: (details) {
                    return details.getIntrinsicRowHeight(details.rowIndex);
                  },
                  source: vm.laporanPenjualanTransaksiDataSource!,
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
                    CustomGridColumn().gridColumn('total', 'Total',
                        alignment: Alignment.center),
                  ],
                ).expand(),
              CustomPaginationWidget(
                currentPage: vm.currentPageTransaksi,
                onPageChange: vm.onPageChangeAllTransaksi,
                totalPage: vm.laporanPerBulanData?.transaksi?.lastPage,
              )
            ],
          )
        );
      },
    );
  }
}
