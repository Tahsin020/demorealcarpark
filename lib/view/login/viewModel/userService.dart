import 'package:demorealcarpark/view/login/model/userModel.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserService{
  Future<List<UserModel>> fectUserItemsAdvance();  
}

class UserService extends IUserService{
  late Dio _dio;
  


  @override
  Future<List<UserModel>> fectUserItemsAdvance() {
    // TODO: implement fectUserItemsAdvance
    throw UnimplementedError();
  }

}