import 'package:soaurl/app/data/data.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad Request', url) {
    Get.find<AnalyticsService>()
        .logApiError(message: message ?? 'Bad Request', link: url ?? 'No Link');
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process', url) {
    Get.find<AnalyticsService>().logApiError(
        message: message ?? 'Fetch Data Exception', link: url ?? 'No Link');
  }
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not Responded', url) {
    Get.find<AnalyticsService>().logApiError(
        message: message ?? 'Api Not Responding', link: url ?? 'No Link');
  }
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorised Request', url) {
    Get.find<AnalyticsService>().logUnAuthorized(link: url ?? 'No Link Found');
  }
}

class LinkTakenException extends AppException {
  LinkTakenException([String? message, String? url])
      : super(message, 'Link is Not Available: Already Taken', url) {
    Get.find<AnalyticsService>().logCheckLinkAvailable(false);
  }
}
