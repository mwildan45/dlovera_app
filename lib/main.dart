import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dlovera_app/constants/app_strings.dart';
import 'package:dlovera_app/constants/app_theme.dart';
import 'package:dlovera_app/services/local_storage.service.dart';
import 'package:dlovera_app/views/pages/home.page.dart';
import 'package:dlovera_app/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dlovera_app/services/routers.services.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.getPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme().lightTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          onGenerateRoute: router.generateRoute,
          theme: theme,
          home: const SplashScreen(),
        );
      }
    );
  }
}
