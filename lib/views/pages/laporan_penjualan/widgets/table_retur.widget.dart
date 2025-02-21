import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/retur.data_source.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanPenjualanReturWidget extends StatefulWidget {
  const TableLaporanPenjualanReturWidget(
      {Key? key,
      required this.data,
      this.onPressed,
      required this.heightTable,
      required this.vm})
      : super(key: key);
  final LaporanPerBulanData? data;
  final Function()? onPressed;
  final LaporanPenjualanViewModel vm;
  final double heightTable;

  @override
  State<TableLaporanPenjualanReturWidget> createState() =>
      _TableLaporanPenjualanReturWidgetState();
}

class _TableLaporanPenjualanReturWidgetState
    extends State<TableLaporanPenjualanReturWidget> {
  late LaporanReturDataSource _laporanPenjualanReturDataSource;

  @override
  void initState() {
    super.initState();
    _laporanPenjualanReturDataSource =
        LaporanReturDataSource(retur: widget.data?.retur?.data ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp5),
          if (_laporanPenjualanReturDataSource.dataGridRows.isEmpty)
            const EmptyDatatable()
          else
            SfDataGrid(
              source: _laporanPenjualanReturDataSource,
              // shrinkWrapRows: true,
              onQueryRowHeight: (details) {
                return details.getIntrinsicRowHeight(details.rowIndex);
              },
              columnWidthMode: ColumnWidthMode.fill,
              // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
              columns: [
                CustomGridColumn().gridColumn('noFaktur', 'No. Faktur'),
                CustomGridColumn().gridColumn('tanggal', 'Tanggal'),
                CustomGridColumn().gridColumn('namaCustomer', 'Nama Konsumen',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('namaBarang', 'Produk',
                    alignment: Alignment.centerLeft),
                CustomGridColumn().gridColumn('alasan', 'Alasan',
                    alignment: Alignment.centerLeft),
              ],
            ).h(widget.heightTable - 100),
          UiSpacer.verticalSpace(space: Vx.dp16),
          CustomButton(
            height: 40,
            title: "lihat semua retur",
            onPressed: _laporanPenjualanReturDataSource.dataGridRows.isEmpty
                ? null
                : () => widget.vm.navigateToAllRetur(widget.vm),
          ).w(210).centered().pOnly(top: Vx.dp12, bottom: Vx.dp8),
        ],
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}
