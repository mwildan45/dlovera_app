// import 'package:velocity_x/velocity_x.dart';


class Api {
  static String get baseUrl {
    return "https://api.higanic.com/api";
  }

  static const login = "/login";

  static const todaySummary = "/todaysummary";

  static const laporanPenjualanChart = "/laporanpenjualan";
  static const laporanPenjualanPerBulan = "/laporanpenjualanperbulan";

  static const laporanPembelianChart = "/laporanpembelian";
  static const laporanPembelianPerBulan = "/laporanpembelianperbulan";

  // Other pages
  // static String get privacyPolicy {
  //   return "$webUrl/privacy/policy";
  // }


  // static Future<String> redirectAuth(String url) async {
  //   final userToken = await AuthServices.getAuthBearerToken();
  //   return "$webUrl/auth/redirect?token=$userToken&url=$url";
  // }
}
