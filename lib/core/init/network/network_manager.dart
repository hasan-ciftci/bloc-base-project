import 'dart:io';

import 'package:bloc_base_project/core/base/base_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();

  static NetworkManager get instance => _instance;
  Dio _dio;

  NetworkManager._internal() {
    _dio = Dio();
  }

  Future dioPost<T extends BaseModel>(
      {@required String baseURL,
      @required String endPoint,
      @required T model}) async {
    try {
      final response = await _dio.post(
        baseURL + endPoint,
        queryParameters: model.toJson(),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          return responseBody;
        default:
      }
    } catch (e) {
      if (e is DioError) {
        print("Dio Error  : $e");
      } else {
        print("Unknown Error  : $e");
      }
    }
  }

  Future dioGet<T extends BaseModel>(
      {@required String baseURL,
      @required String endPoint,
      @required T model}) async {
    try {
      final response = await _dio.get(
        baseURL + endPoint,
        queryParameters: model.toJson(),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          return responseBody;
        default:
      }
    } catch (e) {
      if (e is DioError) {
        print("Dio Error  : $e");
      } else {
        print("Unknown Error  : $e");
      }
    }
  }
}
