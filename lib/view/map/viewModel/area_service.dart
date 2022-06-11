import 'dart:io';

import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IAreaService {
  Future<List<AreaModel>?> fetchParkingAreasItemsAdvance();
  Future<bool> putItemToService(int fiiledAreaCount,int emptyAreaCount,int id);
}

class AreaService implements IAreaService {
  final Dio _dio;
  AreaService() : _dio = Dio();

  @override
  Future<List<AreaModel>?> fetchParkingAreasItemsAdvance() async {
    try {
      final response = await _dio.get('https://demorealcarpark-45643-default-rtdb.firebaseio.com/areas.json');

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => AreaModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(int fiilledAreaCount,int emptyAreaCount,int id) async {
     try {
       final response = await _dio.put('{ "emptyAreaCount": $emptyAreaCount,"filledAreaCount":$fiilledAreaCount} / https://demorealcarpark-45643-default-rtdb.firebaseio.com/areas/$id.json');
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
