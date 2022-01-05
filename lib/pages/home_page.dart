import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller.dart';
import 'package:getx_demo/utils/app_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Get.put(Controller());
  bool brightness = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: _appBar(),
          floatingActionButton: _floatingActionButton(),
          body: _homeBody(),
        ));
  }

  PreferredSizeWidget? _appBar() =>
      AppBar(
        title: Text(AppString.homeAppBar.tr),
        backgroundColor: Colors.blue,
        elevation: 5.0,
        actions: [
          IconButton(onPressed: () {
            if(brightness){
              changeTheme(false);
              setState(() {
                brightness = false;
              });
            }
            else{
              changeTheme(true);
              setState(() {
                brightness = true;
              });
            }
          }, icon: Icon(brightness ? Icons.brightness_7 : Icons.brightness_4)),
          IconButton(
              onPressed: () {
                changeLanguage();
              },
              icon: const Icon(Icons.translate))
        ],
      );

  Widget? _floatingActionButton() =>
      FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      );

  Widget? _homeBody() =>
      Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Clicks: ${controller.count}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppString.secondPage);
                },
                child: Text(AppString.btnSecondPage.tr),
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                ),
              ),
            ],
          );
        }),
      );

  changeLanguage() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: Image.asset('assets/icons/en.svg'),
              title: const Text('English'),
              onTap: () {
                Get.updateLocale(Get.deviceLocale!);
                Get.back();
              },
            ),
            ListTile(
              leading: Image.asset('assets/icons/hi.svg'),
              title: const Text('Hindi'),
              onTap: () {
                Get.updateLocale(const Locale('hi', 'IN'));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
    // Get.updateLocale(Locale('pt', 'BR'));
  }

  changeTheme(theme) {
    theme ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }
}
