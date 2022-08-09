import 'package:dlovera_app/constants/app_images.dart';
import 'package:dlovera_app/view_models/home.vm.dart';
import 'package:dlovera_app/views/pages/home/today_summary.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan.page.dart';
import 'package:dlovera_app/widgets/base.page.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          title: "D'lovera",
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text("Tekan sekali lagi untuk keluar"),
            ),
            child: PageView(
              controller: model.pageViewController,
              onPageChanged: model.onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TodaySummaryPage(pageViewController: model.pageViewController),
                const LaporanPenjualanPage()
              ],
            ),
          ),
          drawerMenu: SizedBox(
            width: 220,
            child: Column(
              children: [
                Image.asset(AppImages.appBanner),
                NavigationRail(
                  selectedIndex: model.currentIndex,
                  onDestinationSelected: model.onTabChange,
                  labelType: NavigationRailLabelType.all,
                  destinations: List.generate(model.listMenu.length, (index) {
                    return NavigationRailDestination(
                      icon: const Icon(Icons.bookmark_border),
                      selectedIcon: const Icon(Icons.book),
                      label: Text(model.listMenu[index]),
                    );
                  }),
                ).expand(),
              ],
            ),
          ),
        );
      }
    );
  }
}
