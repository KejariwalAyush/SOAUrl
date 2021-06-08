import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:soaurl/app/data/data.dart';

const baseUrl = 'http://soaurl.ml/api';

class Api extends GetConnect {
  // Get request
  Future<Response> getResp(String url) => get(url);
  Future<Response> getUser(int id) => get('http://youapi/users/id');
  // Post request
  Future<Response> getUrlList() {
    final _auth = Get.find<AuthService>();
    return post(baseUrl + '/get', jsonEncode({'userId': _auth.fireUser.uid}));
  }

  /// Check if the Url is valid or not
  Future<bool> checkValidUrl(String url) async {
    try {
      // if (!kIsWeb && !url.contains('http')) url = 'https://' + url;
      // if (kIsWeb && url.contains('https://'))
      //   url = url.replaceFirst('https://', '');
      Get.log(url);
      Response response = await getResp(url);
      Get.log('Get Response -> Status Code:' + response.statusCode.toString());
      return response.statusCode == 200;
    } on Exception catch (e) {
      Get.log(e.toString());
      return false;
    }
  }

  Future<Api> init() async {
    Get.log('$runtimeType ready');
    return this;
  }
}
