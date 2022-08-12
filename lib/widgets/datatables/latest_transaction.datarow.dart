import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LatestTransactionsDataSource extends DataGridSource {
  LatestTransactionsDataSource(
      {required List<LatestTransaction> latestTransactions}) {
    dataGridRows = latestTransactions
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'no_faktur', value: dataGridRow.noFaktur),
              DataGridCell<String>(
                  columnName: 'nama_customer', value: dataGridRow.namaCustomer),
              DataGridCell<String>(
                  columnName: 'total',
                  value: double.parse(dataGridRow.grandTotal ?? "0")
                      .currencyValueFormat()),
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
              : (dataGridCell.columnName == 'total')
                  ? Alignment.centerRight
                  : Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
}
