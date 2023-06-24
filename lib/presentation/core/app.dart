import 'package:fittrix_application/presentation/main/main_screen_binding.dart';
import 'package:fittrix_application/routes/app_pages.dart';
import 'package:fittrix_application/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      initialBinding: MainScreenBinding(),
      getPages: AppPages.pages,
    );
  }
}
