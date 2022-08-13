import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LaporanPenjualanCMTLanggananDataSource extends DataGridSource {
  LaporanPenjualanCMTLanggananDataSource(
      {required List<LaporanProduksiPerBulanCMTLangganan> cmtLangganan}) {
    dataGridRows = cmtLangganan
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'Kode_Produsen',
          value: dataGridRow.kodeProdusen),
      DataGridCell<String>(
          columnName: 'Nama_Produsen',
          value: dataGridRow.namaProdusen),
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
              alignment: (dataGridCell.columnName == 'Nama_Produsen')
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
