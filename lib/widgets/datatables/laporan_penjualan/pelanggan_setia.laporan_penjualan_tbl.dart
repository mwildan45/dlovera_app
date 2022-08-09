import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanPenjualanPelangganSetiaDataSource extends DataGridSource {
  LaporanPenjualanPelangganSetiaDataSource({required List<LaporanPenjualanPerBulanPelangganSetia> pelangganSetia}) {
    dataGridRows = pelangganSetia
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'kode_customer', value: dataGridRow.kodeCustomer),
      DataGridCell<String>(columnName: 'nama_customer', value: dataGridRow.namaCustomer),
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