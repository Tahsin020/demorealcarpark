import 'dart:io';
import 'package:demorealcarpark/view/map/model/area_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

abstract class IAreaService {
  Future<List<AreaModel>?> fetchParkingAreasItemsAdvance();
  Future<bool> putItemToService(int fiiledAreaCount,int emptyAreaCount,int id);
  Future<void> updateAreaValue(int id, int filledAreaCount, int emptyAreaCount);
}

class AreaService implements IAreaService {
  final Dio _dio;
  late DatabaseReference _dbref;
  AreaService() : _dio = Dio() , _dbref=FirebaseDatabase.instance.ref();
  final String _path='https://demorealcarpark-45643-default-rtdb.firebaseio.com/areas.json';

  @override
  Future<List<AreaModel>?> fetchParkingAreasItemsAdvance() async {
    try {
      final response = await _dio.get(_path);

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
       final response = await _dio.put('{ "emptyAreaCount": $emptyAreaCount,"filledAreaCount":$fiilledAreaCount} / $_path');
       return response.statusCode == HttpStatus.ok;
     } on DioError catch (error) {
       _ShowDebug.showDioError(error, this);
     }
     return false;
  }

  Future<void> updateAreaValue(int id, int filledAreaCount, int emptyAreaCount) async {
    await _dbref
        .child("areas")
        .child(id.toString())
        .update({"filledAreaCount": filledAreaCount, "emptyAreaCount": emptyAreaCount});
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
