
import 'dart:io';

import 'package:demorealcarpark/view/map/model/parking_areas_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IParkingAreasService{
  Future<List<ParkingAreasModel>?> fetchParkingAreasItemsAdvance();

}

class ParkingAreasService implements IParkingAreasService{
  final Dio _dio;
  ParkingAreasService() :_dio =Dio();

  @override
  Future<List<ParkingAreasModel>?> fetchParkingAreasItemsAdvance() async {
      try {
        final response =await _dio.get('https://demorealcarpark-45643-default-rtdb.firebaseio.com/parkingAreas.json');
        
        if (response.statusCode == HttpStatus.ok) {
          final _datas=response.data;
          if (_datas is List) {
            return _datas.map((e) => ParkingAreasModel.fromJson(e)).toList();
          }
        }
      } on DioError  catch (exception) {
        _ShowDebug.showDioError(exception, this);
      }
      return null;
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