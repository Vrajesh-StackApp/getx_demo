import 'package:flutter/material.dart';
import 'package:getx_demo/pages/home_page.dart';
import 'package:getx_demo/utils/app_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppString.homePage,
      routes: {
        AppString.homePage : (context) => const HomePage(),
      },
    );
  }
}

