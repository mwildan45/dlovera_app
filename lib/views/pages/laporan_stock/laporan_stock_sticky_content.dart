import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_strings.dart';
import 'package:dlovera_app/constants/box.styles.dart';
import 'package:dlovera_app/constants/text.styles.dart';
import 'package:dlovera_app/models/stock.model.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/laporan_stock.vm.dart';
import 'package:dlovera_app/views/pages/laporan_stock/widgets/table_stock_persediaan_bahan_baku.widget.dart';
import 'package:dlovera_app/views/pages/laporan_stock/widgets/table_stock_persediaan_produk.widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StickyContentLaporanStock extends StatelessWidget {
  const StickyContentLaporanStock({Key? key, this.data, required this.vm})
      : super(key: key);

  final DataStock? data;
  final LaporanStockViewModel vm;

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    return VStack(
      [
        Container(
          decoration: BoxStyles.boxContent(),
          child: VStack(
            [
              'Produk'
                  .text
                  .lg
                  .bold
                  .color(AppColor.primaryColorDark)
                  .align(TextAlign.center)
                  .make()
                  .centered(),
              UiSpacer.verticalSpace(space: Vx.dp8),
              HStack(
                [
                  VStack(
                    [
                      TextStyles.labelBoxText(label: "Termahal"),
                      UiSpacer.divider(),
                      HStack(
                        [
                          AppStrings.appCurrency.text
                              .size(Vx.dp16)
                              .make()
                              .centered()
                              .pOnly(bottom: 18),
                          (data?.produk?.termahal ?? 0)
                              .toString()
                              .text
                              .bold
                              .size(25)
                              .make()
                              .centered(),
                        ],
                        crossAlignment: CrossAxisAlignment.start,
                      )
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                    alignment: MainAxisAlignment.center,
                  ).expand(),
                  VStack(
                    [
                      TextStyles.labelBoxText(label: "Termurah"),
                      UiSpacer.divider(),
                      HStack(
                        [
                          AppStrings.appCurrency.text
                              .size(Vx.dp16)
                              .make()
                              .centered()
                              .pOnly(bottom: 18),
                          (data?.produk?.termurah ?? 0)
                              .toString()
                              .text
                              .bold
                              .size(25)
                              .make()
                              .centered(),
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
        Container(
          decoration: BoxStyles.boxContent(),
          child: VStack(
            [
              'Bahan Baku'
                  .text
                  .lg
                  .bold
                  .color(AppColor.primaryColorDark)
                  .align(TextAlign.center)
                  .make()
                  .centered(),
              UiSpacer.verticalSpace(space: Vx.dp8),
              HStack(
                [
                  VStack(
                    [
                      TextStyles.labelBoxText(label: "Termahal"),
                      UiSpacer.divider(),
                      HStack(
                        [
                          AppStrings.appCurrency.text
                              .size(Vx.dp16)
                              .make()
                              .centered()
                              .pOnly(bottom: 18),
                          (data?.bahanBaku?.termahal ?? 0)
                              .toString()
                              .text
                              .bold
                              .size(25)
                              .make()
                              .centered(),
                        ],
                        crossAlignment: CrossAxisAlignment.start,
                      )
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                    alignment: MainAxisAlignment.center,
                  ).expand(),
                  VStack(
                    [
                      TextStyles.labelBoxText(label: "Termurah"),
                      UiSpacer.divider(),
                      HStack(
                        [
                          AppStrings.appCurrency.text
                              .size(Vx.dp16)
                              .make()
                              .centered()
                              .pOnly(bottom: 18),
                          (data?.bahanBaku?.termurah ?? 0)
                              .toString()
                              .text
                              .bold
                              .size(25)
                              .make()
                              .centered(),
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
        // CustomDoubleBoxContents(
        //   firstContent: VStack(
        //     [
        //       TextStyles.labelBoxText(label: "Produk Termahal"),
        //       UiSpacer.divider(),
        //       HStack(
        //         [
        //           AppStrings.appCurrency.text.size(Vx.dp16).make().centered(),
        //           // .pOnly(bottom: 18),
        //           Flexible(
        //               child: (data?.transaksiTertinggi ?? "0")
        //                   .text
        //                   .bold
        //                   .size(25)
        //                   .make())
        //         ],
        //         crossAlignment: CrossAxisAlignment.start,
        //       )
        //     ],
        //     crossAlignment: CrossAxisAlignment.center,
        //     alignment: MainAxisAlignment.center,
        //   ),
        //   secondContent: VStack(
        //     [
        //       TextStyles.labelBoxText(label: "Produk Termurah"),
        //       UiSpacer.divider(),
        //       HStack(
        //         [
        //           AppStrings.appCurrency.text.size(Vx.dp16).make().centered(),
        //           // .pOnly(bottom: 18),
        //           Flexible(
        //               child: (data?.transaksiTerendah ?? "0")
        //                   .text
        //                   .bold
        //                   .size(25)
        //                   .make())
        //         ],
        //         crossAlignment: CrossAxisAlignment.start,
        //       )
        //     ],
        //     crossAlignment: CrossAxisAlignment.center,
        //     alignment: MainAxisAlignment.center,
        //   ),
        // ),
        // UiSpacer.verticalSpace(),
        // TableLaporanStockProdukTerlarisWidget(data: data),
        UiSpacer.verticalSpace(),
        DefaultTabController(
          length: 2,
          child: VStack(
            [
              TabBar(
                tabs: [
                  Tab(child: "Persediaan Produk".text.lg.bold.make()),
                  Tab(child: "Persediaan Bahan Baku".text.lg.bold.make())
                ],
                indicatorColor: AppColor.primaryColorDark,
              ),
              TabBarView(
                children: [
                  TableLaporanStockPersediaanProdukWidget(
                    data: data,
                    heightTable: heightScreen / 1.2,
                    vm: vm,
                  ).h(heightScreen / 1.2).p8(),
                  TableLaporanStockPersediaanBahanBakuWidget(
                    data: data,
                    heightTable: heightScreen / 1.2,
                    vm: vm,
                  ).h(heightScreen / 1.2).p8()
                ],
              ).h(heightScreen / 1.2),
            ],
          ),
        )
      ],
    ).p12();
  }
}
