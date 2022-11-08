import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/laporan_produksi.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanProduksiAllTransaksiPage extends StatelessWidget {
  const LaporanProduksiAllTransaksiPage({Key? key, this.viewModel})
      : super(key: key);
  final LaporanProduksiViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanProduksiViewModel>.reactive(
      viewModelBuilder: () => LaporanProduksiViewModel(context),
      onModelReady: (model) => model.onPageChangeAllTransaksi(1,
          month: viewModel?.selectedMonth, year: viewModel?.selectedYear, day: viewModel?.selectedDay),
      builder: (context, vm, child) {
        return BasePage(
          title:
              "Laporan Transaksi Produksi ${vm.laporanPerBulanData?.day} ${vm.laporanPerBulanData?.month} ${vm.laporanPerBulanData?.year}",
          body: VStack(
            [
              if (vm.busy(vm.laporanTransaksiDataSource))
                Image.asset(AppImages.appLoadingGear).centered()
              else
                SfDataGrid(
                  onQueryRowHeight: (details) {
                    return details.getIntrinsicRowHeight(details.rowIndex);
                  },
                  onCellTap: (DataGridCellTapDetails details) {
                    final column = details.column.columnName;
                    var idb;
                    try {
                      idb = vm.laporanTransaksiDataSource!.effectiveRows[details.rowColumnIndex.rowIndex - 1].getCells()[details.rowColumnIndex.columnIndex].value;
                    }catch(e) {
                      return;
                    }
                    print("column $column");
                    if(column == "noFaktur"){
                      vm.getDetailTransaksi(idb, Api.laporanProduksiDetailTransaksi);
                    }
                  },
                  source: vm.laporanTransaksiDataSource!,
                  shrinkWrapRows: true,
                  allowSorting: true,
                  sortingGestureType: SortingGestureType.tap,
                  columnWidthMode: ColumnWidthMode.fill,
                  verticalScrollPhysics: const BouncingScrollPhysics(),
                  columns: [
                    CustomGridColumn().gridColumn('noFaktur', 'No. Faktur'),
                    // CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                    CustomGridColumn().gridColumn(
                        'namaProdusen', 'Nama CMT',
                        alignment: Alignment.centerLeft),
                    // CustomGridColumn().gridColumn('namaBarang', 'Bahan',
                    //     alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('total', 'Jasa',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('bayar', 'Status Bayar'),
                    CustomGridColumn().gridColumn('kirim', 'Status Kirim'),
                  ],
                ).expand(),
              CustomPaginationWidget(
                currentPage: vm.currentPageTransaksi,
                onPageChange: vm.onPageChangeAllTransaksi,
                totalPage: vm.laporanPerBulanData?.transaksi?.lastPage,
              )
            ],
          ),
        );
      },
    );
  }
}
