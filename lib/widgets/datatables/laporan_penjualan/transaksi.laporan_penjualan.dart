import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:dlovera_app/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanPenjualanTransaksiDataSource extends DataGridSource {
  LaporanPenjualanTransaksiDataSource(
      {required List<LaporanPerBulanTransaksiData> transaksi}) {
    dataGridRows = transaksi
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'noFaktur', value: dataGridRow.noFaktur),
              DataGridCell<String>(
                  columnName: 'tanggal', value: dataGridRow.tanggal),
              DataGridCell<String>(
                  columnName: dataGridRow.namaCustomer == null
                      ? 'namaSupplier'
                      : 'namaCustomer',
                  value: dataGridRow.namaCustomer ?? dataGridRow.namaSupplier),
              DataGridCell<String>(
                  columnName: 'namaBarang', value: dataGridRow.namaBarang),
              DataGridCell<String>(
                  columnName: 'total', value: double.parse(dataGridRow.total ?? "0").currencyValueFormat()),
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
                  dataGridCell.columnName == 'namaBarang')
              ? Alignment.centerLeft : dataGridCell.columnName == 'total' ? Alignment.centerRight
              : Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.clip,
          ));
    }).toList());
  }
}
