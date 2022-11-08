import 'package:dlovera_app/models/detail_transaksi.model.dart';
import 'package:dlovera_app/models/kartu_stok.model.dart';
import 'package:dlovera_app/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanDetailTransaksiDataSource extends DataGridSource {
  LaporanDetailTransaksiDataSource(
      {required List<DetailTransaksiProduct> detailTransaksi}) {
    dataGridRows = detailTransaksi
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'namaProduk', value: dataGridRow.namaBarang),
      DataGridCell<String>(
          columnName: 'hargaSatuan', value: double.parse(dataGridRow.hargaSatuan ?? "0")
          .currencyValueFormat()),
      DataGridCell<String>(
          columnName: 'qty',
          value: dataGridRow.jumlah.toString()),
      DataGridCell<String>(
          columnName: 'total',
          value: double.parse(dataGridRow.total.toString()).currencyValueFormat()),
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
              alignment: (dataGridCell.columnName == 'total')
                  ? Alignment.centerRight
                  : Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.clip,
              ));
        }).toList());
  }
}
