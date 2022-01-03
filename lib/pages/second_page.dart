import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller.dart';
import 'package:getx_demo/utils/app_string.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _secondBody(),
      ),
    );
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: Text(AppString.secondAppBar),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _secondBody() => Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.picsumList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.picsumList[index].author),
                );
              },
            );
          }
        },
      );
}
