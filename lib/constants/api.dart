// import 'package:velocity_x/velocity_x.dart';


class Api {
  static String get baseUrl {
    return "https://api.higanic.com/api";
  }

  static const todaySummary = "/todaysummary";

  // Other pages
  // static String get privacyPolicy {
  //   return "$webUrl/privacy/policy";
  // }


  // static Future<String> redirectAuth(String url) async {
  //   final userToken = await AuthServices.getAuthBearerToken();
  //   return "$webUrl/auth/redirect?token=$userToken&url=$url";
  // }
}
