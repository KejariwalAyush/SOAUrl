import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  // static final String baseUrl = "http://www.soaurl.ml/api/";

  NetworkHelper({this.url});

  // static final String url = 'BASE_URL';
  static BaseOptions opts = BaseOptions(
    // baseUrl: baseUrl,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) => requestInterceptor(options),
            onError: (DioError e) async {
              return e.response.data;
            }),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = '';
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      log('Get Response -> Status:' + response.statusMessage);
      return response;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Response> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      log('Post Response -> Status:' + response.statusMessage);
      return response;
    } on DioError catch (e) {
      // print(e);
      log(e.toString());
      return null;
    }
  }

  Future<Response> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);

      log('Put Response -> Status:' + response.statusMessage);
      return response;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Response> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      log('Delete Response -> Status:' + response.statusMessage);
      return response;
    } on DioError catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future post(String url, dynamic data) async {
    try {
      http.Response response = await http.post(url, body: data, headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      });
      log('HTTP Post -> Status Code:' + response.statusCode.toString());

      if (response.statusCode == 200)
        return (response.body);
      else
        return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> checkValidUrl(String url) async {
    try {
      if (!kIsWeb && !url.contains('http')) url = 'https://' + url;
      if (kIsWeb && url.contains('https://'))
        url = url.replaceFirst('https://', '');
      log(url);
      http.Response response = await http.get(url);
      log('Get Response -> Status Code:' + response.statusCode.toString());
      return response.statusCode == 200;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
