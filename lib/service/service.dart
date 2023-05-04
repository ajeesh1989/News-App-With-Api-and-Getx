import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_app/api_baseUrl/base_url.dart';
import 'package:news_app/api_endUrl/end_url.dart';
import 'package:news_app/model/model.dart';

class Service {
  Dio dio = Dio();
  final baseUrl = ApiBaseUrl();
  final endUrl = ApiEndUrl();
  Future<NewsModel?> getAllNews() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.all);
      log(response.statusCode.toString(), name: 'get sports status code');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final getAllNewsResult = NewsModel.fromJson(response.data);
        log(getAllNewsResult.toString());
        return getAllNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get all news error');
      Get.snackbar('Something went wrong', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<NewsModel?> getSportsNews() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.sports);
      log(response.statusCode.toString(), name: 'get sports status code');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final getSportsNewsResult = NewsModel.fromJson(response.data);
        return getSportsNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get sports news error');
      Get.snackbar('Something went wrong', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<NewsModel?> getBusinessNews() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.business);
      log(response.statusCode.toString(), name: 'get business status code');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final getBusinessNewsResult = NewsModel.fromJson(response.data);
        return getBusinessNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get business news error');
      Get.snackbar('Something went wrong', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<NewsModel?> getScienceNews() async {
    try {
      final response = await dio.get(baseUrl.baseUrl + endUrl.science);
      log(response.statusCode.toString(), name: 'get science status code');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final getScienceNewsResult = NewsModel.fromJson(response.data);
        return getScienceNewsResult;
      }
    } on DioError catch (error) {
      log(error.message.toString(), name: 'get science news error');
      Get.snackbar('Something went wrong', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
