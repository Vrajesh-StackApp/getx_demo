import 'package:get/get.dart';
import 'package:getx_demo/data/models/picsum.dart';
import 'package:getx_demo/data/services/http_service.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var isLoading = false.obs;
  RxList picsumList =[].obs;

  @override
  void onInit() {
    fetchApiData();
    super.onInit();
  }

  void increment() {
    count++;
  }

  void fetchApiData() async {
    try {
      isLoading(true);
      List<Picsum> picsumData = await HttpService().fetchData();
      if (picsumData != null) {
        picsumList.value = picsumData;
      }
    } finally {
      isLoading(false);
    }
  }
}
