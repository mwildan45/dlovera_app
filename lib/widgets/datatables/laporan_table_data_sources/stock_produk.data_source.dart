import 'package:dlovera_app/models/stock.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanStockProdukBahanBakuDataSource extends DataGridSource {
  LaporanStockProdukBahanBakuDataSource(
      {required List<DataProdukBahanBaku> stockProdukBahanBaku}) {
    dataGridRows = stockProdukBahanBaku
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'kodeProduk', value: dataGridRow.kodeBarang),
      DataGridCell<String>(
          columnName: 'namaBarang', value: dataGridRow.namaBarang),
      DataGridCell<String>(
          columnName: 'hargaSatuan',
          value: dataGridRow.hargaSatuan),
      DataGridCell<String>(
          columnName: 'golongan', value: dataGridRow.golongan),
      DataGridCell<String>(
          columnName: 'stockAkhir', value: dataGridRow.stockAkhir.toString()),
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
              alignment: (dataGridCell.columnName == 'namaBarang')
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
