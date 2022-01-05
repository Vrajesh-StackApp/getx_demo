import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/localization/localization.dart';
import 'package:getx_demo/pages/home_page.dart';
import 'package:getx_demo/pages/second_page.dart';
import 'package:getx_demo/utils/app_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppString.homePage,
      locale: Get.deviceLocale,
      translationsKeys: translationKey,
      routes: {
        AppString.homePage: (context) => const HomePage(),
        AppString.secondPage: (context) => const SecondPage(),
      },
    );
  }
}
