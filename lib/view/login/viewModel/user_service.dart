import 'dart:io';
import 'package:demorealcarpark/view/login/model/userModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IUserService {
  Future<List<UserModel>?> fectUserItemsAdvance();
  Future<List<UserModel>?> fetchUserWithPostId(int postId);
  Future<bool> addItemToService(UserModel userModel);
  Future<bool> putItemToService(UserModel userModel, int id);
  Future<bool> deleteItemToService(int id);
}

class UserService extends IUserService {
  final Dio _dio;
  UserService() : _dio = Dio();
  final String _path = 'https://demorealcarpark-45643-default-rtdb.firebaseio.com/users.json';

  @override
  Future<List<UserModel>?> fectUserItemsAdvance() async {
    try {
      final response = await _dio.get('$_path');
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => UserModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<bool> addItemToService(UserModel userModel) async {
    try {
      final response = await _dio.post(_path, data: userModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete(_path, queryParameters: {"id": id});

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<List<UserModel>?> fetchUserWithPostId(int postId) async {
    try {
      final response = await _dio.get(_path, queryParameters: {"id": postId});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => UserModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(UserModel userModel, int id) async {
    try {
      final response = await _dio.put(_path, data: userModel, queryParameters: {"id": id});
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
