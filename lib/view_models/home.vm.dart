import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dlovera_app/models/user.dart';
import 'package:dlovera_app/services/app.services.dart';
import 'package:dlovera_app/services/auth.service.dart';
import 'package:dlovera_app/view_models/base.view_model.dart';
import 'package:dlovera_app/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeViewModel extends MyBaseViewModel {
  //
  HomeViewModel(BuildContext context) {
    viewContext = context;
  }

  //
  int currentIndex = 0;
  PageController pageViewController = PageController(initialPage: 0);
  StreamSubscription? homePageChangeStream;
  List<String> listMenu = ['Rekap Harian', 'laporan Penjualan', 'Laporan Pembelian', 'Laporan Produksi', 'Stok Inventori'];
  List<IconData> listMenuIcon = [Icons.dashboard, Icons.sell, Icons.area_chart_rounded, Icons.insert_chart_outlined, Icons.inventory];
  bool isWasConnectionLoss = false;
  late StreamSubscription<ConnectivityResult> subscription;
  User? user;

  @override
  void initialise() async {
    user = await AuthServices.getCurrentUser();

    notifyListeners();

    homePageChangeStream = AppService.instance?.homePageIndex.stream.listen(
          (index) {
        //
        onTabChange(index);
      },
    );
  }

  //
  @override
  dispose() {
    super.dispose();
    homePageChangeStream?.cancel();
  }

  //
  onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  //
  onTabChange(int index) {
    currentIndex = index;
    pageViewController.animateToPage(
      currentIndex,
      duration: const Duration(microseconds: 5),
      curve: Curves.bounceInOut,
    );
    viewContext?.pop();
    notifyListeners();
  }

  //
  void checkInternetConnection() async {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('Connectivity $result');
      if(result == ConnectivityResult.none) {
        viewContext?.showToast(
            msg: 'Tidak ada koneksi internet, aplikasi tidak akan berjalan dengan baik',
            textColor: Colors.white,
            bgColor: Colors.red,
            showTime: 3000);
      }
    });
  }

  /**
   * Logout
   */
  logoutPressed() async {
    CoolAlert.show(
      context: viewContext!,
      type: CoolAlertType.confirm,
      title: "Logout",
      text: "Anda yakin ingin logout?",
      onConfirmBtnTap: () {
        viewContext?.pop();
        processLogout();
      },
    );
  }

  void processLogout() async {
    //
    CoolAlert.show(
      context: viewContext!,
      type: CoolAlertType.loading,
      title: "Logout",
      text: "Logging out, please wait...",
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), (){
      viewContext?.pop();
      AuthServices.logout();
      viewContext?.navigator?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreen()),
            (route) => false,
      );
    });
  }
}
