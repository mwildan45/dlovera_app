import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanStockProdukPage extends StatelessWidget {
  const LaporanStockProdukPage({Key? key, this.vm}) : super(key: key);
  final LaporanStockViewModel? vm;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanStockViewModel>.reactive(
          viewModelBuilder: () => LaporanStockViewModel(context),
          onModelReady: (model) => model.onPageChangeAllStockProduk(1,
              month: vm?.selectedMonth, year: vm?.selectedYear),
          builder: (context, vm, child) {
            return BasePage(
              title: "Laporan Stock Produk ${vm.laporanPerBulanData?.month} ${vm.laporanPerBulanData?.year}",
              body: VStack(
                [
                  if (vm.busy(vm.laporanStockProdukDataSource))
                    Image.asset(AppImages.appLoadingGear).centered()
                  else
                    SfDataGrid(
                      onQueryRowHeight: (details) {
                        return details.getIntrinsicRowHeight(details.rowIndex);
                      },
                      source: vm.laporanStockProdukDataSource!,
                      shrinkWrapRows: true,
                      columnWidthMode: ColumnWidthMode.fill,
                      verticalScrollPhysics: const BouncingScrollPhysics(),
                      columns: [
                        CustomGridColumn().gridColumn('kodeProduk', 'Kode Produk'),
                        CustomGridColumn().gridColumn('barcode', 'Barcode'),
                        CustomGridColumn().gridColumn('Nama_Barang', 'Nama Barang',
                            alignment: Alignment.centerLeft),
                        CustomGridColumn().gridColumn('golongan', 'Golongan'),
                        CustomGridColumn().gridColumn('Stock_Akhir', 'Stock Akhir'),
                      ],
                    ).expand(),
                  CustomPaginationWidget(
                    currentPage: vm.currentPageRetur,
                    onPageChange: vm.onPageChangeAllStockProduk,
                    totalPage: vm.laporanPerBulanData?.retur?.lastPage,
                  )
                ],
              ),
            );
          });
  }
}
