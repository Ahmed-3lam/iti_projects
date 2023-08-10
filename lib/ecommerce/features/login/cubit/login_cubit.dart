import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:iti_projects/ecommerce/features/login/model/LoginModel.dart';
import 'package:iti_projects/ecommerce/main/view/main_screen.dart';
import 'package:iti_projects/ecommerce/network/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final DioHelper _dioHelper = DioHelper();

  Future login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final Response response = await _dioHelper.postData(
        url: "login",
        body: {
          "email": email,
          "password": password,
        },
      );

      // if (response.data["data"]==true) {
      //   Get.Get.offAll(MainScreen());
      // }else{
      //   Get.Get.snackbar(response.data["message"], " Error",
      //       backgroundColor: Colors.red);
      // }

      final loginModel = LoginModel.fromJson(response.data);

      if(loginModel.status==true){
        Get.Get.offAll(MainScreen());
      }else{
          Get.Get.snackbar(response.data["message"], " Error",
              backgroundColor: Colors.red);
      }

      emit(LoginSuccessState());
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(LoginErrorState());
    }
  }
}
