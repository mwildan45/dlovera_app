import 'package:dlovera_app/models/kartu_stok.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class  LaporanKartuStockDataSource extends DataGridSource {
  LaporanKartuStockDataSource(
      {required List<DataTableKartuStok> kartuStock}) {
    dataGridRows = kartuStock
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'tanggal', value: dataGridRow.tanggal),
      DataGridCell<String>(
          columnName: 'keterangan', value: dataGridRow.keterangan),
      DataGridCell<String>(
          columnName: 'masuk',
          value: dataGridRow.masuk.toString()),
      DataGridCell<String>(
          columnName: 'keluar',
          value: dataGridRow.keluar.toString()),
      DataGridCell<String>(
          columnName: 'retur',
          value: dataGridRow.retur.toString()),
      DataGridCell<String>(
          columnName: 'sisa',
          value: dataGridRow.sisa.toString()),
      DataGridCell<String>(
          columnName: 'admin', value: dataGridRow.createdBy),
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
              alignment: (dataGridCell.columnName == 'tanggal' || dataGridCell.columnName == 'keterangan' || dataGridCell.columnName == 'admin')
                  ? Alignment.center
                  : Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.clip,
              ));
        }).toList());
  }
}
