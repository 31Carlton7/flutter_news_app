import 'package:dio/dio.dart';

class NewsExceptions implements Exception {
  NewsExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Error retirieving articles";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Missing API Key';
      case 404:
        return 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      case 429:
        return 'Request limit reached';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
