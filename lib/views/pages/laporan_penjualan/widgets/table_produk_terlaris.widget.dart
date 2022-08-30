import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/produk_terlaris.data_source.dart';
import 'package:dlovera_app/widgets/empty_datatable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class TableLaporanPenjualanProdukTerlarisWidget extends StatefulWidget {
  const TableLaporanPenjualanProdukTerlarisWidget(
      {Key? key, required this.data, this.onPressed})
      : super(key: key);
  final LaporanPerBulanData? data;
  final Function()? onPressed;

  @override
  State<TableLaporanPenjualanProdukTerlarisWidget> createState() =>
      _TableLaporanPenjualanProdukTerlarisWidgetState();
}

class _TableLaporanPenjualanProdukTerlarisWidgetState
    extends State<TableLaporanPenjualanProdukTerlarisWidget> {
  late LaporanProdukTerlarisDataSource
      _laporanPenjualanProdukTerlarisDataSource;

  @override
  void initState() {
    super.initState();
    _laporanPenjualanProdukTerlarisDataSource =
        LaporanProdukTerlarisDataSource(
            produkTerlaris: widget.data?.produkTerlaris ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxStyles.boxContent(),
      child: VStack(
        [
          UiSpacer.verticalSpace(space: Vx.dp8),
          TextStyles.labelBoxText(label: "Produk Terlaris").centered(),
          UiSpacer.divider().centered(),
          UiSpacer.verticalSpace(space: Vx.dp5),
          _laporanPenjualanProdukTerlarisDataSource.dataGridRows.isEmpty
              ? const EmptyDatatable()
              : SfDataGrid(
                  source: _laporanPenjualanProdukTerlarisDataSource,
                  shrinkWrapRows: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                  columns: [
                    CustomGridColumn().gridColumn('kode_barang', 'Kode Barang'),
                    CustomGridColumn().gridColumn('nama_barang', 'Nama Barang',
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
