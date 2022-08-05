import 'package:dlovera_app/constants/app_routes.dart';
import 'package:dlovera_app/views/pages/home.page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());

    // case AppRoutes.productDetailsRoute:
    //   return MaterialPageRoute(
    //     settings: RouteSettings(name: AppRoutes.productDetailsRoute),
    //     builder: (context) => ProductDetailsPage(
    //       product: settings.arguments,
    //     ),
    //   );

    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
