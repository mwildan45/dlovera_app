import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/models/stock.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/stock_produk.data_source.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanStockPersediaanBahanBakuWidget extends StatefulWidget {
  const TableLaporanStockPersediaanBahanBakuWidget(
      {Key? key,
        required this.data,
        required this.vm,
        required this.heightTable})
      : super(key: key);
  final DataStock? data;
  final LaporanStockViewModel vm;
  final double heightTable;

  @override
  State<TableLaporanStockPersediaanBahanBakuWidget> createState() =>
      _TableLaporanStockPersediaanBahanBakuWidgetState();
}

class _TableLaporanStockPersediaanBahanBakuWidgetState
    extends State<TableLaporanStockPersediaanBahanBakuWidget> {
  late LaporanStockProdukBahanBakuDataSource _laporanStockProdukDataSource;

  @override
  void initState() {
    super.initState();
    _laporanStockProdukDataSource = LaporanStockProdukBahanBakuDataSource(
        stockProdukBahanBaku: widget.data?.persediaanBahanBaku?.data ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
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
                CustomGridColumn().gridColumn('namaBarang', 'Nama Barang',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('jumlahSatuan', 'Harga'),
                CustomGridColumn().gridColumn('golongan', 'Kategori'),
                CustomGridColumn().gridColumn('stockAkhir', 'Stock'),
              ],
            ).h(widget.heightTable - 132),
          UiSpacer.verticalSpace(space: Vx.dp16),
          CustomButton(
            height: 40,
            title: "lihat semua persediaan",
            onPressed: _laporanStockProdukDataSource.dataGridRows.isEmpty
                ? null
                : () => widget.vm.navigateToPersediaanBahanBakuAll(widget.vm),
          ).w(250).centered().pOnly(top: Vx.dp12, bottom: Vx.dp8),
        ],
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}
