import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:soaurl/app/data/data.dart';
import 'app_exception_service.dart';

final baseUrl = 'http://soaurl.ml/api';

class Api extends GetConnect {
  final _auth = Get.find<AuthService>();
  final _fcm = Get.find<FCMService>();
  static const int TIME_OUT_DURATION = 10;
  String? bearerToken;

  Future<Api> init() async {
    Get.log('$runtimeType ready');
    return this;
  }

  /// Logging in and getting bearer token
  ///
  Future login() async {
    var _uri = Uri.parse(baseUrl + '/v1/auth/login');
    String body = '''{  "uid": ${_auth.fireUser!.uid},
                        "appV": "2.0.0",
                        "fcm": ${_fcm.fcmToken}}''';
    try {
      var _resp = await post(_uri.toString(), jsonEncode(body))
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      var _value = _processResponse(_resp);
      return _value;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  /// Make Quick Link
  ///
  Future quickLink(String link) async {
    var _uri = Uri.parse(baseUrl + '/v1/link/quickLink');
    var body = "{'link': $link}";
    try {
      var _resp = await post(_uri.toString(), jsonEncode(body),
              headers: {'bearer-token': bearerToken ?? ''})
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      var _value = _processResponse(_resp);
      return _value;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  /// Make Custom Short Link
  ///
  Future customLink({required String link, required String shortLink}) async {
    var _uri = Uri.parse(baseUrl + '/v1/link/customLink');
    var body = "{'link':$link,'shortLink':$shortLink}";
    try {
      var _resp = await post(_uri.toString(), jsonEncode(body),
              headers: {'bearer-token': bearerToken ?? ''})
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      var _value = _processResponse(_resp);
      return _value;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  /// Check Custom Link Availablity
  ///
  Future checkCustomLink(String link) async {
    var _uri = Uri.parse(baseUrl + '/v1/link/checkCustomLink');
    var body = "{'link': $link}";
    try {
      var _resp = await post(_uri.toString(), jsonEncode(body),
              headers: {'bearer-token': bearerToken ?? ''})
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      var _value = _processResponse(_resp);
      return _value;
    } on SocketException {
      throw FetchDataException('Connection Error', _uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', _uri.toString());
    }
  }

  /// Get List of Urls using your bearer token
  ///
  Future<UrlList> getUrlList() async {
    var uri = Uri.parse(baseUrl + '/get');
    try {
      var resp = await post(
          uri.toString(),
          jsonEncode(
            {'userId': _auth.fireUser!.uid},
          )).timeout(Duration(seconds: TIME_OUT_DURATION));
      var value = _processResponse(resp);
      if (value.toString().contains("status") &&
          value.toString().contains("error")) return UrlList(urlDetails: null);
      var urlList = UrlList.fromJson('{"urlDetails":' + value.toString() + '}');
      Get.log('Got UrlList from Server');
      return urlList;
    } on SocketException {
      throw FetchDataException('Connection Error', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Api not responded in time', uri.toString());
    }
  }

  /// Check if the Url is valid or not
  Future<bool> checkValidUrl(String url) async {
    try {
      // if (!kIsWeb && !url.contains('http')) url = 'https://' + url;
      // if (kIsWeb && url.contains('https://'))
      //   url = url.replaceFirst('https://', '');
      Get.log(url);
      Response response = await get(url);
      Get.log('Get Response -> Status Code:' + response.statusCode.toString());
      return response.statusCode == 200;
    } on Exception catch (e) {
      Get.log(e.toString());
      return false;
    }
  }

  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var respJson = response.body;
        return respJson;

      case 400: // bad request
        throw BadRequestException(
            response.body, response.request!.url.toString());

      case 401: // unautherised
        throw UnAuthorizedException(
            response.body, response.request!.url.toString());

      case 403:

      case 406: // Link Taken
        throw LinkTakenException(
            response.body, response.request!.url.toString());

      case 500: // internal server error

      default:
        throw FetchDataException(
            'Error occured with code: ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
