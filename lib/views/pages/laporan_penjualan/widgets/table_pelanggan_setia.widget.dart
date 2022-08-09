import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/laporan_penjualan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_penjualan/pelanggan_setia.laporan_penjualan_tbl.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanPenjualanPelangganSetiaWidget extends StatefulWidget {
  const TableLaporanPenjualanPelangganSetiaWidget(
      {Key? key, required this.data, this.onPressed})
      : super(key: key);
  final LaporanPenjualanPerBulanData? data;
  final Function()? onPressed;

  @override
  State<TableLaporanPenjualanPelangganSetiaWidget> createState() =>
      _TableLaporanPenjualanPelangganSetiaWidgetState();
}

class _TableLaporanPenjualanPelangganSetiaWidgetState
    extends State<TableLaporanPenjualanPelangganSetiaWidget> {
  late LaporanPenjualanPelangganSetiaDataSource
      _laporanPenjualanPelangganSetiaDataSource;

  @override
  void initState() {
    super.initState();
    _laporanPenjualanPelangganSetiaDataSource =
        LaporanPenjualanPelangganSetiaDataSource(
            pelangganSetia: widget.data?.pelangganSetia ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp8),
          TextStyles.labelBoxText(label: "Pelanggan Setia").centered(),
          UiSpacer.divider().centered(),
          UiSpacer.verticalSpace(space: Vx.dp5),
          _laporanPenjualanPelangganSetiaDataSource.dataGridRows.isEmpty
              ? const EmptyDatatable()
              : SfDataGrid(
                  source: _laporanPenjualanPelangganSetiaDataSource,
                  shrinkWrapRows: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                  columns: [
                    CustomGridColumn()
                        .gridColumn('kode_customer', 'Kode Customer'),
                    CustomGridColumn().gridColumn(
                        'nama_customer', 'Nama Customer',
                        alignment: Alignment.centerLeft),
                  ],
                ),
          UiSpacer.verticalSpace(space: Vx.dp16),
          // CustomButton(
          //   height: 40,
          //   title: "See all transactions",
          //   onPressed: widget.onPressed,
          // ).w(210).centered().pOnly(top: Vx.dp12, bottom: Vx.dp16),
          // UiSpacer.verticalSpace(space: Vx.dp8),
        ],
      ),
    );
  }
}
