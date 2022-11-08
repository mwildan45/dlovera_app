import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanTransaksiDataSource extends DataGridSource {
  LaporanTransaksiDataSource(
      {required List<LaporanPerBulanTransaksiData> transaksi, BuildContext? context}) {
    dataGridRows = transaksi
        .map<DataGridRow>((dataGridRow) =>
        DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'noFaktur', value: dataGridRow.noFaktur),
          // DataGridCell<String>(
          //     columnName: 'tanggal', value: dataGridRow.tanggal),
          if(dataGridRow.namaSupplier != null)
            DataGridCell<String>(
                columnName: 'namaSupplier',
                value: dataGridRow.namaSupplier)
          else
            if(dataGridRow.namaCustomer != null)
              DataGridCell<String>(
                  columnName: 'namaCustomer',
                  value: dataGridRow.namaCustomer)
          else
            if(dataGridRow.namaProdusen != null)
              DataGridCell<String>(
                  columnName: 'namaProdusen',
                  value: dataGridRow.namaProdusen),
          // DataGridCell<String>(
          //     columnName: 'namaBarang', value: dataGridRow.namaBarang),
          DataGridCell<String>(
              columnName: 'total',
              value: double.parse(dataGridRow.total ?? "0")
                  .currencyValueFormat()),
          DataGridCell<String>(
              columnName: 'bayar', value: dataGridRow.bayar),
          DataGridCell<String>(
              columnName: 'kirim', value: dataGridRow.kirim),
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
              alignment: (dataGridCell.columnName == 'namaCustomer' ||
                  dataGridCell.columnName == 'namaSupplier' ||
                  dataGridCell.columnName == 'namaProdusen' ||
                  dataGridCell.columnName == 'namaBarang')
                  ? Alignment.centerLeft : dataGridCell.columnName == 'total'
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
