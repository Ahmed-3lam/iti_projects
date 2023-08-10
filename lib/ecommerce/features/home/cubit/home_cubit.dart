import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:iti_projects/ecommerce/features/home/model/BannerModel.dart';
import 'package:iti_projects/ecommerce/features/home/model/ProductsModel.dart';
import 'package:iti_projects/ecommerce/network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final DioHelper _dioHelper = DioHelper();
  BannerModel bannerModel = BannerModel();
  ProductsModel productsModel = ProductsModel();

  Future getBanners() async {
    emit(HomeBannerLoading());

    try {
      final Response response = await _dioHelper.getData(
        url: "banners",
      );

      bannerModel = BannerModel.fromJson(response.data);

      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        Get.Get.snackbar(response.data["message"], " Error",
            backgroundColor: Colors.red);
        emit(HomeBannerError());
      }
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(HomeBannerError());
    }
  }



  /// Get Products
  Future getProducts() async {
    emit(HomeProductsLoading());

    try {
      final Response response = await _dioHelper.getData(
        url: "products",
      );

      productsModel = ProductsModel.fromJson(response.data);

      if (productsModel.status == true) {
        emit(HomeProductsSuccess());
      } else {
        Get.Get.snackbar(response.data["message"], " Error",
            backgroundColor: Colors.red);
        emit(HomeProductsError());
      }
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(HomeProductsError());
    }
  }


}
