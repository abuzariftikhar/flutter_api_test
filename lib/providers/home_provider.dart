import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/services/user_list/reponse/user_list.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<UserList?> getAllUsers(int pageNumber) async {
    try {
      Response response = await _dio.get("/users");
      print(response.data);
      return UserList.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
