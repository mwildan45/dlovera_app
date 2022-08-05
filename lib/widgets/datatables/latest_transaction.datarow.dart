import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LatestTransactionsDataSource extends DataGridSource {
  LatestTransactionsDataSource({required List<LatestTransaction> totalTransactions}) {
    dataGridRows = totalTransactions
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'no_faktur', value: dataGridRow.noFaktur),
      DataGridCell<String>(columnName: 'nama_customer', value: dataGridRow.namaCustomer),
      DataGridCell<String>(
          columnName: 'total', value: dataGridRow.grandTotal),
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
              alignment: (dataGridCell.columnName == 'nama_customer')
                  ? Alignment.centerLeft
                  : Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
}