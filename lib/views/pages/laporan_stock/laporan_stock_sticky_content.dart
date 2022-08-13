import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_strings.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/laporan_per_bulan.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_produksi.vm.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/widgets/table_cmt_langganan.widget.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/widgets/table_produk_terlaris.widget.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/widgets/table_retur.widget.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/widgets/table_transaksi.widget.dart';
import 'package:dlovera_app/views/pages/laporan_stock/widgets/table_stock_produk.widget.dart';
import 'package:dlovera_app/views/pages/laporan_stock/widgets/table_stock_produk_terlaris.widget.dart';
import 'package:dlovera_app/widgets/box_contents/custom_double_box_contents.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:velocity_x/velocity_x.dart';

class StickyContentLaporanStock extends StatelessWidget {
  const StickyContentLaporanStock({Key? key, this.data, required this.vm}) : super(key: key);

  final LaporanPerBulanData? data;
  final LaporanStockViewModel vm;

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    return StickyHeader(
      header: 'Laporan Stock ${data?.month} ${data?.year}'
          .text
          .lg
          .bold
          .white
          .align(TextAlign.center)
          .make()
          .centered()
          .box
          .color(AppColor.primaryColorDark)
          .width(double.maxFinite)
          .height(Vx.dp56)
          .p12
          .make(),
      content: VStack(
        [
          Container(
            decoration: BoxStyles.boxContent(),
            child: VStack(
              [
                'Rata-Rata Harian'
                    .text
                    .lg
                    .bold
                    .color(AppColor.primaryColorDark)
                    .align(TextAlign.center)
                    .make()
                    .centered(),
                UiSpacer.verticalSpace(),
                HStack(
                  [
                    VStack(
                      [
                        TextStyles.labelBoxText(label: "Produk Terjual"),
                        UiSpacer.divider(),
                        HStack(
                          [
                            (data?.rataRata?.produkTerjual ?? 0).toString()
                                .text
                                .bold
                                .size(25)
                                .make()
                                .centered(),
                            'pcs'
                                .text
                                .size(Vx.dp16)
                                .make()
                                .centered()
                                .pOnly(bottom: 18, left: Vx.dp4),
                          ],
                          crossAlignment: CrossAxisAlignment.start,
                        )
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                      alignment: MainAxisAlignment.center,
                    ).expand(),
                    VStack(
                      [
                        TextStyles.labelBoxText(label: "Produk Retur"),
                        UiSpacer.divider(),
                        HStack(
                          [
                            (data?.rataRata?.produkRetur ?? 0)
                                .text
                                .bold
                                .size(25)
                                .make()
                                .centered(),
                            'pcs'
                                .text
                                .size(Vx.dp16)
                                .make()
                                .centered()
                                .pOnly(bottom: 18, left: Vx.dp4),
                          ],
                        )
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                      alignment: MainAxisAlignment.center,
                    ).expand(),
                  ],
                  crossAlignment: CrossAxisAlignment.start,
                )
              ],
            ).p8(),
          ).w(double.maxFinite),
          UiSpacer.verticalSpace(),
          CustomDoubleBoxContents(
            firstContent: VStack(
              [
                TextStyles.labelBoxText(label: "Produk Termahal"),
                UiSpacer.divider(),
                HStack(
                  [
                    AppStrings.appCurrency.text.size(Vx.dp16).make().centered(),
                    // .pOnly(bottom: 18),
                    Flexible(
                        child: (data?.transaksiTertinggi ?? "0")
                            .text
                            .bold
                            .size(25)
                            .make())
                  ],
                  crossAlignment: CrossAxisAlignment.start,
                )
              ],
              crossAlignment: CrossAxisAlignment.center,
              alignment: MainAxisAlignment.center,
            ),
            secondContent: VStack(
              [
                TextStyles.labelBoxText(label: "Produk Termurah"),
                UiSpacer.divider(),
                HStack(
                  [
                    AppStrings.appCurrency.text.size(Vx.dp16).make().centered(),
                    // .pOnly(bottom: 18),
                    Flexible(
                        child: (data?.transaksiTerendah ?? "0")
                            .text
                            .bold
                            .size(25)
                            .make())
                  ],
                  crossAlignment: CrossAxisAlignment.start,
                )
              ],
              crossAlignment: CrossAxisAlignment.center,
              alignment: MainAxisAlignment.center,
            ),
          ),
          UiSpacer.verticalSpace(),
          TableLaporanStockProdukTerlarisWidget(data: data),
          UiSpacer.verticalSpace(),
          TableLaporanStockProdukWidget(
            data: data,
            heightTable: heightScreen / 1.5,
            vm: vm,
          ).h(heightScreen / 1.5).p8()


//           DefaultTabController(
//             length: 2,
//             child: VStack(
//               [
//                 TabBar(
//                   tabs: [
//                     Tab(child: "Transaksi".text.lg.bold.make()),
//                     Tab(child: "Retur".text.lg.bold.make())
//                   ],
//                   indicatorColor: AppColor.primaryColorDark,
//                 ),
//                 TabBarView(
//                   children: [
// ,
//                     TableLaporanProduksiReturWidget(
//                       data: data,
//                       heightTable: heightScreen / 1.5,
//                       vm: vm,
//                     ).h(heightScreen / 2).p8()
//                   ],
//                 ).h(heightScreen / 1.5),
//               ],
//             ),
//           )
        ],
      ).p12(),
    );
  }
}
