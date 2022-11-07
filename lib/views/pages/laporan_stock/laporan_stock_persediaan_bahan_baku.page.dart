import 'package:dlovera_app/constants/api.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockPersediaanBahanBakuPage extends StatelessWidget {
  const LaporanStockPersediaanBahanBakuPage({Key? key, this.vm}) : super(key: key);
  final LaporanStockViewModel? vm;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanStockViewModel>.reactive(
        viewModelBuilder: () => LaporanStockViewModel(context),
        onModelReady: (model) => model.onPageChangePersediaanBahanBaku(1,
            month: vm?.selectedMonth, year: vm?.selectedYear),
        builder: (context, vm, child) {
          return BasePage(
            title: "Laporan Stock Persediaan Bahan Baku",
            body: VStack(
              [
                if (vm.busy(vm.laporanStockProdukBahanBakuDataSource))
                  Image.asset(AppImages.appLoadingGear).centered()
                else
                  SfDataGrid(
                    onQueryRowHeight: (details) {
                      return details.getIntrinsicRowHeight(details.rowIndex);
                    },
                    onCellTap: (DataGridCellTapDetails details) {
                      final column = details.column.columnName;
                      final idb = vm.laporanStockProdukBahanBakuDataSource!.effectiveRows[details.rowColumnIndex.rowIndex - 1].getCells()[details.rowColumnIndex.columnIndex].value;
                      print("column $column");
                      if(column == "kodeProduk"){
                        vm.getDetailKartuStok(idb, Api.kartuStokProduk);
                      }
                    },
                    source: vm.laporanStockProdukBahanBakuDataSource!,
                    shrinkWrapRows: true,
                    columnWidthMode: ColumnWidthMode.fill,
                    verticalScrollPhysics: const BouncingScrollPhysics(),
                    columns: [
                      CustomGridColumn().gridColumn('kodeProduk', 'Kode Produk'),
                      CustomGridColumn().gridColumn('namaBarang', 'Nama Barang',
                          alignment: Alignment.centerLeft),
                      CustomGridColumn().gridColumn('jumlahSatuan', 'Harga'),
                      CustomGridColumn().gridColumn('golongan', 'Kategori'),
                      CustomGridColumn().gridColumn('stockAkhir', 'Stock'),
                    ],
                  ).expand(),
                CustomPaginationWidget(
                  currentPage: vm.currentPageBahanBaku,
                  onPageChange: vm.onPageChangePersediaanBahanBaku,
                  totalPage: vm.stockData?.data?.persediaanBahanBaku?.lastPage,
                )
              ],
            ),
          );
        });
  }
}
