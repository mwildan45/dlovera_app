import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanPenjualanPelangganSetiaDataSource extends DataGridSource {
  LaporanPenjualanPelangganSetiaDataSource(
      {required List<LaporanPerBulanPelangganSetia> pelangganSetia}) {
    dataGridRows = pelangganSetia
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: dataGridRow.kodeCustomer != null
                      ? 'kode_customer'
                      : 'kode_supplier',
                  value: dataGridRow.kodeCustomer ?? dataGridRow.kodeSupplier),
              DataGridCell<String>(
                  columnName: dataGridRow.namaCustomer != null
                      ? 'nama_customer'
                      : 'nama_supplier',
                  value: dataGridRow.namaCustomer ?? dataGridRow.namaSupplier),
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
          alignment: (dataGridCell.columnName == 'nama_customer' ||
                  dataGridCell.columnName == 'nama_supplier')
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
