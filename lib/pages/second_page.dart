import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text(AppString.secondAppBar.tr),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      );

  Widget? _secondBody() => Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: controller.picsumList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1.0,
                  color: Colors.grey,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.snackbar(
                      controller.picsumList[index].author,
                      '',
                      messageText: const SizedBox.shrink(),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blue.shade100,
                    );
                  },
                  child: ListTile(
                    title: Text(
                      controller.picsumList[index].author,
                      style: const TextStyle(fontSize: 18),
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 100.0,
                      height: 100.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(controller.picsumList[index].downloadUrl),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      );


}
