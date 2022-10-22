import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/laporan_pembelian.vm.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/pagination.widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class LaporanPembelianAllReturPage extends StatelessWidget {
  const LaporanPembelianAllReturPage({Key? key, this.vm}) : super(key: key);
  final LaporanPembelianViewModel? vm;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LaporanPembelianViewModel>.reactive(
      viewModelBuilder: () => LaporanPembelianViewModel(context),
      onModelReady: (model) => model.onPageChangeAllRetur(1,
          month: vm?.selectedMonth, year: vm?.selectedYear),
      builder: (context, vm, child) {
        return BasePage(
          title:
              "Laporan Retur Pembelian ${vm.laporanPerBulanData?.month} ${vm.laporanPerBulanData?.year}",
          body: VStack(
            [
              if (vm.busy(vm.laporanReturDataSource))
                Image.asset(AppImages.appLoadingGear).centered()
              else
                SfDataGrid(
                  onQueryRowHeight: (details) {
                    return details.getIntrinsicRowHeight(details.rowIndex);
                  },
                  source: vm.laporanReturDataSource!,
                  shrinkWrapRows: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  verticalScrollPhysics: const BouncingScrollPhysics(),
                  columns: [
                    CustomGridColumn().gridColumn('noFaktur', 'No. Faktur'),
                    CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                    CustomGridColumn().gridColumn(
                        'namaSupplier', 'Nama Supplier',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('namaBarang', 'Bahan Baku',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('alasan', 'Nilai',
                        alignment: Alignment.centerLeft),
                  ],
                ).expand(),
              CustomPaginationWidget(
                currentPage: vm.currentPageRetur,
                onPageChange: vm.onPageChangeAllRetur,
                totalPage: vm.laporanPerBulanData?.retur?.lastPage,
              )
            ],
          ),
        );
      },
    );
  }
}
