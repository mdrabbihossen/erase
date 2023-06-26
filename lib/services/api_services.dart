import 'dart:io';

import 'package:erase/utils/const.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  // remove bg
  static removeBackground(String imagePath) async {
    http.MultipartRequest requestUrl=http.MultipartRequest("POST",Api.baseUrl);
    requestUrl.headers.addAll({"X-Api-Key":Api.apiKey});
  }
}