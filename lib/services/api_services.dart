
import 'package:erase/utils/const.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // remove bg
  static removeBackground(String imagePath) async {
    http.MultipartRequest requestUrl =
        http.MultipartRequest("POST", Api.baseUrl);
    requestUrl.headers.addAll({"X-API-Key": Api.apiKey});
    requestUrl.files
        .add(await http.MultipartFile.fromPath("image_file", imagePath));
    final response = await requestUrl.send();
    if (response.statusCode == 200) {
      http.Response imageResponse = await http.Response.fromStream(response);
      return imageResponse.bodyBytes;
    } else {
      print("failed to fetch data");
      return null;
    }
  }
}
