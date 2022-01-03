import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:getx_demo/controller.dart';
import 'package:getx_demo/utils/app_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(),
      body: _homeBody(),
    ));
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.homeAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _floatingActionButton() => FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      );

  Widget? _homeBody() => Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Clicks: ${controller.count}",
                style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppString.secondPage);
                  },
                  child: const Text("Second")),
            ],
          );
        }),
      );
}
