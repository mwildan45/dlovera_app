import 'package:dlovera_app/constants/app_colors.dart';
import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/utils/ui_spacer.dart';
import 'package:dlovera_app/view_models/home.vm.dart';
import 'package:dlovera_app/views/pages/home/today_summary.page.dart';
import 'package:dlovera_app/views/pages/laporan_pembelian/laporan_pembelian.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan.page.dart';
import 'package:dlovera_app/views/pages/laporan_produksi/laporan_produksi.page.dart';
import 'package:dlovera_app/views/pages/laporan_stock/laporan_stock.page.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:dlovera_app/widgets/buttons/custom_button.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HomeViewModel(context).checkInternetConnection();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return BasePage(
            body: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text("Tekan sekali lagi untuk keluar"),
              ),
              child: PageView(
                controller: model.pageViewController,
                onPageChanged: model.onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TodaySummaryPage(
                      pageViewController: model.pageViewController),
                  const LaporanPenjualanPage(),
                  const LaporanPembelianPage(),
                  const LaporanProduksiPage(),
                  const LaporanStockPage(),
                ],
              ),
            ),
            drawerMenu: Container(
              width: 220,
              color: AppColor.primaryColorDark,
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset(AppImages.appBanner, height: 150, width: double.maxFinite, fit: BoxFit.fill,),
                    SideNavigationBar(
                      expandable: false,
                      theme: SideNavigationBarTheme(
                        itemTheme: SideNavigationBarItemTheme(selectedItemColor: AppColor.primaryColorDark),
                        togglerTheme: SideNavigationBarTogglerTheme.standard(),
                        dividerTheme: SideNavigationBarDividerTheme.standard(),
                        backgroundColor: Colors.white
                      ),
                      selectedIndex: model.currentIndex,
                      items: List.generate(model.listMenu.length, (index) {
                        return SideNavigationBarItem(
                          icon: model.listMenuIcon[index],
                          label: model.listMenu[index],
                        );
                      }),
                      onTap: model.onTabChange,
                    ).pOnly(top: 8).expand(),
                    UiSpacer.verticalSpace(space: 8),
                    'Login: ${model.user?.username}'.text.white.make(),
                    CustomButton(
                      height: 30,
                      elevation: 0,
                      onPressed: () => model.logoutPressed(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Logout'.text.bold.white.make(),
                          UiSpacer.horizontalSpace(space: 5),
                          Icon(Icons.logout, size: 16, color: Colors.white,)
                        ],
                      ),
                    ),
                    UiSpacer.verticalSpace(space: 8),

                    // NavigationRail(
                    //   selectedIndex: model.currentIndex,
                    //   onDestinationSelected: model.onTabChange,
                    //   labelType: NavigationRailLabelType.all,
                    //   destinations: List.generate(model.listMenu.length, (index) {
                    //     return NavigationRailDestination(
                    //       icon: const Icon(Icons.bookmark_border),
                    //       selectedIcon: const Icon(Icons.book),
                    //       label: Text(model.listMenu[index]),
                    //     );
                    //   }),
                    // ).expand(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
