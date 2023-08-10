import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_projects/api_test/model/PostModel.dart';
import 'package:iti_projects/ecommerce/main/view/main_screen.dart';

import 'model/LoginModel.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(minutes: 20),
      receiveTimeout: Duration(seconds: 50),
      responseType: ResponseType.json,
      headers: headers,
    ));
  }

  ///Login
  Future login({
    required String email,
    required String password,
  }) async {
    LoginModel model = LoginModel();

    try {
      var response = await dio!.post(
        "login",
        data: {
          "email": email,
          "password": password,
        },
      );

      model = LoginModel.fromJson(response.data);
      print("==============================================================" +
          response.data.toString());
      if (model.status == false) {
        Get.snackbar(model.message ?? "", "", backgroundColor: Colors.red);
      } else {
        Get.offAll(MainScreen());
      }
    } catch (e) {
      print(e);
    }
  }


  // Future fetchData() async {
  //   const url = "https://jsonplaceholder.typicode.com/posts";
  //   final response = await dio!.get(url);
  //   final myData = response.data;
  //   List apiList = [];
  //   //
  //   // for (var item in myData) {
  //   //   final post = PostModel.fromJson(item);
  //   //
  //   //   apiList.add(post);
  //   //
  //   // }
  //
  //   apiList = myData.map((item) => PostModel.fromJson(item)).toList();
  //
  //   developer.log(apiList.toString());
  // }





}

Map<String, dynamic> headers = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};
