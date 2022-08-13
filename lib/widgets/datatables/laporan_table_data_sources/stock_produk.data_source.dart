import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanStockProdukDataSource extends DataGridSource {
  LaporanStockProdukDataSource(
      {required List<LaporanPerBulanProdukData> stockProduk}) {
    dataGridRows = stockProduk
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'kodeProduk', value: dataGridRow.kodeBarang),
      DataGridCell<String>(
          columnName: 'barcode', value: dataGridRow.barcode),
      DataGridCell<String>(
          columnName: 'Nama_Barang',
          value: dataGridRow.namaBarang),
      DataGridCell<String>(
          columnName: 'golongan', value: dataGridRow.golongan),
      DataGridCell<String>(
          columnName: 'Stock_Akhir', value: dataGridRow.stockAkhir.toString()),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: (dataGridCell.columnName == 'Nama_Barang')
                  ? Alignment.centerLeft
                  : Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.clip,
              ));
        }).toList());
  }
}
