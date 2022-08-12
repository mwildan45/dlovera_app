import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_pembelian.vm.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_penjualan/transaksi.laporan_penjualan.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanPembelianTransaksiWidget extends StatefulWidget {
  const TableLaporanPembelianTransaksiWidget(
      {Key? key,
      required this.data,
      required this.vm,
      required this.heightTable})
      : super(key: key);
  final LaporanPerBulanData? data;
  final LaporanPembelianViewModel vm;
  final double heightTable;

  @override
  State<TableLaporanPembelianTransaksiWidget> createState() =>
      _TableLaporanPembelianTransaksiWidgetState();
}

class _TableLaporanPembelianTransaksiWidgetState
    extends State<TableLaporanPembelianTransaksiWidget> {
  late LaporanPenjualanTransaksiDataSource _laporanPenjualanTransaksiDataSource;

  @override
  void initState() {
    super.initState();
    _laporanPenjualanTransaksiDataSource = LaporanPenjualanTransaksiDataSource(
        transaksi: widget.data?.transaksi?.data ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp5),
          if (_laporanPenjualanTransaksiDataSource.dataGridRows.isEmpty)
            const EmptyDatatable()
          else
            SfDataGrid(
              rowsPerPage: 20,
              onQueryRowHeight: (details) {
                return details.getIntrinsicRowHeight(details.rowIndex);
              },
              source: _laporanPenjualanTransaksiDataSource,
              shrinkWrapRows: true,
              columnWidthMode: ColumnWidthMode.fill,
              // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
              columns: [
                CustomGridColumn().gridColumn('noFaktur', 'No. Faktur'),
                CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                CustomGridColumn().gridColumn('namaSupplier', 'Nama Supplier',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('namaBarang', 'Nama Barang',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('total', 'Total',
                    alignment: Alignment.centerLeft),
              ],
            ).h(widget.heightTable - 100),
          UiSpacer.verticalSpace(space: Vx.dp16),
          CustomButton(
            height: 40,
            title: "See all transaksi",
            onPressed: _laporanPenjualanTransaksiDataSource.dataGridRows.isEmpty
                ? null
                : () => widget.vm.navigateToAllTransaksi(widget.vm),
          ).w(210).centered().pOnly(top: Vx.dp12, bottom: Vx.dp8),
        ],
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}
