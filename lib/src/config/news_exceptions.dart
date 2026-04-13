import 'package:dio/dio.dart';

class NewsExceptions implements Exception {
  final String message;

  NewsExceptions(this.message);

  factory NewsExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return NewsExceptions('Request to API server was cancelled');
      case DioErrorType.connectTimeout:
        return NewsExceptions('Connection timeout with API server');
      case DioErrorType.receiveTimeout:
        return NewsExceptions('Receive timeout in connection with API server');
      case DioErrorType.sendTimeout:
        return NewsExceptions('Send timeout in connection with API server');
      case DioErrorType.response:
        return NewsExceptions(_handleStatusCode(dioError.response?.statusCode));
      case DioErrorType.other:
      default:
        return NewsExceptions('Error retrieving articles');
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Missing API Key';
      case 404:
        return 'The requested resource was not found';
      case 429:
        return 'Request limit reached';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
