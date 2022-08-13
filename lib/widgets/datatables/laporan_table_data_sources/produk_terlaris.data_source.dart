import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/models/today_summary.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanPenjualanProdukTerlarisDataSource extends DataGridSource {
  LaporanPenjualanProdukTerlarisDataSource({required List<LaporanPerBulanProdukTerlaris> produkTerlaris}) {
    dataGridRows = produkTerlaris
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'kode_barang', value: dataGridRow.kodeBarang),
      DataGridCell<String>(columnName: 'nama_barang', value: dataGridRow.namaBarang),
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
              alignment: (dataGridCell.columnName == 'nama_barang')
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