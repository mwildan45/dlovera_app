import 'package:dlovera_app/models/kartu_stok.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/detailed/kartu_stok.data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

void DialogStokKartu(context, {
  KartuStokData? data,
  required LaporanKartuStockDataSource laporanKartuStockDataSource,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: VStack(
              [
                "Kartu Stok Produk".text.lg.bold.make().centered(),
                UiSpacer.divider().centered(),
                UiSpacer.verticalSpace(space: 12),
                VStack(
                  [
                    _buildaHeaderInfo("Kode Barang", data?.kodeBarang),
                    _buildaHeaderInfo("Nama Barang", data?.namaBarang),
                    _buildaHeaderInfo("Merk", data?.merk),
                    _buildaHeaderInfo("Harga Satuan", data?.hargaSatuan),
                    _buildaHeaderInfo("Kategori", data?.kategori),
                    _buildaHeaderInfo("Satuan", data?.satuan),
                    UiSpacer.verticalSpace(space: 12),
                    _buildaHeaderInfo("Total Masuk", data?.totalMasuk),
                    _buildaHeaderInfo("Total Keluar", data?.totalKeluar),
                    _buildaHeaderInfo("Total Retur", data?.totalRetur),
                    _buildaHeaderInfo("Total Sisa", data?.totalSisa),
                  ],
                ),
                UiSpacer.verticalSpace(),
                SfDataGrid(
                  rowsPerPage: 10,
                  onQueryRowHeight: (details) {
                    return details.getIntrinsicRowHeight(details.rowIndex);
                  },
                  source: laporanKartuStockDataSource,
                  shrinkWrapRows: true,
                  columnWidthMode: ColumnWidthMode.auto,
                  // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                  columns: [
                    CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                    CustomGridColumn().gridColumn('keterangan', 'Keterangan'),
                    CustomGridColumn().gridColumn('masuk', 'Masuk',
                        alignment: Alignment.centerLeft),
                    CustomGridColumn().gridColumn('keluar', 'Keluar'),
                    CustomGridColumn().gridColumn('retur', 'Retur'),
                    CustomGridColumn().gridColumn('sisa', 'Sisa'),
                    CustomGridColumn().gridColumn('admin', 'Admin'),
                  ],
                ).h(500)
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildaHeaderInfo(String label, data) {
  return HStack(
    [
      label.text.bold.make().w(110),
      " : ".text.bold.make(),
      "$data".text.bold.make().expand(),
    ],
  );
}
