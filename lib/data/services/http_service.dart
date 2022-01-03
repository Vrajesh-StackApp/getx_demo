import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_demo/data/models/picsum.dart';
import 'package:getx_demo/utils/app_string.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Picsum>> fetchData() async {
    http.Response response = await http.get(Uri.parse(AppString.baseUrl));
    if (response.statusCode == HttpStatus.ok) {
      String data = response.body;
      return picsumFromJson(data);
    } else {
      throw Exception();
    }
  }
}
