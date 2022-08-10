import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_pembelian.vm.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPembelianAllTransaksiPage extends StatelessWidget {
  const LaporanPembelianAllTransaksiPage({Key? key, this.viewModel}) : super(key: key);
  final LaporanPembelianViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanPembelianViewModel>.reactive(
      viewModelBuilder: () => LaporanPembelianViewModel(context),
      onModelReady: (model) => model.onPageChangeAllTransaksi(1,
          month: viewModel?.selectedMonth, year: viewModel?.selectedYear),
      builder: (context, vm, child) {
        return BasePage(
          title: "Laporan Pembelian Transaksi ${vm.laporanPenjualanPerBulanData?.month} ${vm.laporanPenjualanPerBulanData?.year}",
          floatingActionWidget: CustomPaginationWidget(
            currentPage: vm.currentPageTransaksi,
            onPageChange: vm.onPageChangeAllTransaksi,
            totalPage: vm.laporanPenjualanPerBulanData?.transaksi?.lastPage,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: VStack(
              [
                vm.busy(vm.laporanPenjualanTransaksiDataSource)
                    ? Image.asset(AppImages.appLoadingGear).centered()
                    : SfDataGrid(
                  onQueryRowHeight: (details) {
                    return details
                        .getIntrinsicRowHeight(details.rowIndex);
                  },
                  source: vm.laporanPenjualanTransaksiDataSource!,
                  shrinkWrapRows: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  verticalScrollPhysics: const BouncingScrollPhysics(),
                  columns: [
                    CustomGridColumn()
                        .gridColumn('noFaktur', 'No. Faktur'),
                    CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                    CustomGridColumn().gridColumn(
                        'namaCustomer', 'Nama Supplier',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn(
                        'namaBarang', 'Nama Barang',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('total', 'Total',
                        alignment: Alignment.centerLeft),
                  ],
                ),
                UiSpacer.verticalSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}
