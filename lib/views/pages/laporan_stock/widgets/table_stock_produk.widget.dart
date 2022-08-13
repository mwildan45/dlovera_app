import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_pembelian.vm.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/view_models/laporan_produksi.vm.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/stock_produk.data_source.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/transaksi.data_source.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanStockProdukWidget extends StatefulWidget {
  const TableLaporanStockProdukWidget(
      {Key? key,
      required this.data,
      required this.vm,
      required this.heightTable})
      : super(key: key);
  final LaporanPerBulanData? data;
  final LaporanStockViewModel vm;
  final double heightTable;

  @override
  State<TableLaporanStockProdukWidget> createState() =>
      _TableLaporanStockProdukWidgetState();
}

class _TableLaporanStockProdukWidgetState
    extends State<TableLaporanStockProdukWidget> {
  late LaporanStockProdukDataSource _laporanStockProdukDataSource;

  @override
  void initState() {
    super.initState();
    _laporanStockProdukDataSource = LaporanStockProdukDataSource(
        stockProduk: widget.data?.produk?.data ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp8),
          TextStyles.labelBoxText(label: "Produk").centered(),
          UiSpacer.divider().centered(),
          UiSpacer.verticalSpace(space: Vx.dp5),
          if (_laporanStockProdukDataSource.dataGridRows.isEmpty)
            const EmptyDatatable()
          else
            SfDataGrid(
              rowsPerPage: 20,
              onQueryRowHeight: (details) {
                return details.getIntrinsicRowHeight(details.rowIndex);
              },
              source: _laporanStockProdukDataSource,
              shrinkWrapRows: true,
              columnWidthMode: ColumnWidthMode.fill,
              // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
              columns: [
                CustomGridColumn().gridColumn('kodeProduk', 'Kode Produk'),
                CustomGridColumn().gridColumn('barcode', 'Barcode'),
                CustomGridColumn().gridColumn('Nama_Barang', 'Nama Barang',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('golongan', 'Golongan'),
                CustomGridColumn().gridColumn('Stock_Akhir', 'Stock Akhir'),
              ],
            ).h(widget.heightTable - 120),
          UiSpacer.verticalSpace(space: Vx.dp16),
          CustomButton(
            height: 40,
            title: "See all stock produk",
            onPressed: _laporanStockProdukDataSource.dataGridRows.isEmpty
                ? null
                : () => widget.vm.navigateToAllStockProduk(widget.vm),
          ).w(210).centered().pOnly(top: Vx.dp12, bottom: Vx.dp8),
        ],
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}
