// import 'package:velocity_x/velocity_x.dart';


//DEVELOPED BY Mochamad Wildan A.S.
//Contact: wildan3000x@gmail.com



class Api {
  static String get baseUrl {
    // return "https://api.higanic.com/api";
    return "https://api.dlovera.com/api";
  }

  static const login = "/login";

  static const todaySummary = "/todaysummary";

  static const laporanPenjualanChart = "/laporanpenjualan";
  static const laporanPenjualanPerBulan = "/laporanpenjualanperbulan";

  static const laporanPembelianChart = "/laporanpembelian";
  static const laporanPembelianPerBulan = "/laporanpembelianperbulan";

  static const laporanProduksiChart = "/laporanproduksi";
  static const laporanProduksiPerBulan = "/laporanproduksiperbulan";

  static const laporanStock = "/laporanstockperbulan";

  // Other pages
  // static String get privacyPolicy {
  //   return "$webUrl/privacy/policy";
  // }


  // static Future<String> redirectAuth(String url) async {
  //   final userToken = await AuthServices.getAuthBearerToken();
  //   return "$webUrl/auth/redirect?token=$userToken&url=$url";
  // }
}
