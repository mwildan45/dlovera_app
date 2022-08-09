import 'package:dlovera_app/constants/app_routes.dart';
import 'package:dlovera_app/view_models/laporan_penjualan.vm.dart';
import 'package:dlovera_app/views/pages/auth/login.page.dart';
import 'package:dlovera_app/views/pages/home.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan.page.dart';
import 'package:dlovera_app/views/pages/laporan_penjualan/laporan_penjualan_all_transaksi.page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());

    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());

    case AppRoutes.laporanPenjualan:
      return MaterialPageRoute(
        settings: const RouteSettings(name: AppRoutes.laporanPenjualan),
        builder: (context) => const LaporanPenjualanPage(),
      );

    // case AppRoutes.laporanPenjualanTransaksiAll:
    //   return MaterialPageRoute(
    //     settings: const RouteSettings(name: AppRoutes.laporanPenjualanTransaksiAll, arguments: <String, dynamic>{}),
    //     builder: (context) => LaporanPenjualanAllTransaksiPage(vm: settings.arguments!['vm']),
    //   );

    case AppRoutes.laporanPenjualanReturAll:
      return MaterialPageRoute(
        settings: const RouteSettings(name: AppRoutes.laporanPenjualanReturAll),
        builder: (context) => const LaporanPenjualanPage(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
