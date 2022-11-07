import 'dart:convert';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/models/detail_transaksi.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/widgets/datatables/custom_grid_column.widget.dart';
import 'package:dlovera_app/widgets/datatables/laporan_table_data_sources/detailed/detail_transaksi.data_source.dart';
import 'package:dlovera_app/widgets/zoom_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

void DialogDetailTransaksiAll(
  context, {
  DetailTransaksiData? data,
  required LaporanDetailTransaksiDataSource laporanDetailTransaksiDataSource,
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
                "Detail Transaksi".text.lg.bold.make().centered(),
                UiSpacer.divider().centered(),
                UiSpacer.verticalSpace(space: 12),
                HStack(
                  [
                    if (data?.buktiPembayaran != "")
                      InkWell(
                        onTap: () {
                          context.pushTransparentRoute(ZoomedImage(
                            imageData: data?.buktiPembayaran ?? "",
                            heroId: data!.faktur!,
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Hero(
                            tag: data!.faktur!,
                            child: Image.memory(
                              base64Decode(data.buktiPembayaran ?? ""),
                              fit: BoxFit.cover,
                              width: 120,
                              height: 80,
                            ),
                          ),
                        ),
                      ),
                    UiSpacer.horizontalSpace(),
                    if (data?.buktiPengiriman != "")
                      InkWell(
                        onTap: () {
                          context.pushTransparentRoute(ZoomedImage(
                            imageData: data?.buktiPengiriman ?? "",
                            heroId: data!.faktur!,
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Hero(
                            tag: data!.faktur!,
                            child: Image.memory(
                              base64Decode(data.buktiPengiriman ?? ""),
                              fit: BoxFit.cover,
                              width: 120,
                              height: 80,
                            ),
                          ),
                        ),
                      ),
                  ]
                ),
                UiSpacer.verticalSpace(space: 12),
                VStack(
                  [
                    _buildaHeaderInfo("No Faktur", data?.faktur),
                    _buildaHeaderInfo("Tanggal", data?.tanggal),
                    _buildaHeaderInfo("Nama Konsumen", data?.konsumen),
                    _buildaHeaderInfo("Status Bayar", data?.statusBayar),
                    _buildaHeaderInfo("Status Kirim", data?.statusPengiriman),
                    UiSpacer.verticalSpace(space: 12),
                    _buildaHeaderInfo("Total Qty", data?.totalQty),
                    _buildaHeaderInfo("Total Semua", data?.allTotal),
                  ],
                ),
                UiSpacer.verticalSpace(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.primaryColor, width: 2)),
                  child: SfDataGrid(
                    rowsPerPage: 20,
                    onQueryRowHeight: (details) {
                      return details.getIntrinsicRowHeight(details.rowIndex);
                    },
                    source: laporanDetailTransaksiDataSource,
                    shrinkWrapRows: true,
                    columnWidthMode: ColumnWidthMode.fill,
                    // verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                    columns: [
                      CustomGridColumn()
                          .gridColumn('namaProduk', 'Nama Produk'),
                      CustomGridColumn()
                          .gridColumn('hargaSatuan', 'Harga Satuan'),
                      CustomGridColumn().gridColumn('qty', 'Qty'),
                      CustomGridColumn().gridColumn('total', 'Total'),
                    ],
                  ).h(400),
                )
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
