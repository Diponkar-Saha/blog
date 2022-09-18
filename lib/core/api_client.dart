import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final Dio _dio = Dio();




  Future<dynamic> registerUser(Map<String, dynamic>? data) async {



    try {
      Response response = await _dio.post(
          'https://apitest.hotelsetting.com/api/login',
          data: data,

          );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }



  Future<dynamic> postUser(Map<String, dynamic>? data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('stringValue');
    try {
      Response response = await _dio.post(
        'https://apitest.hotelsetting.com/api/admin/blog-news/store',
        data: data,

        options: Options(
          headers: {'Authorization': 'Bearer ${stringValue}'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }///admin/blog-news/delete/21

  Future<dynamic> postDelete(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('stringValue');
    try {
      Response response = await _dio.delete(
        'https://apitest.hotelsetting.com/api/admin/blog-news/delete/$id',


        options: Options(
          headers: {'Authorization': 'Bearer ${stringValue}'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }


  Future<dynamic> editPost(Map<String, dynamic>? data,String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('stringValue');
    try {
      Response response = await _dio.post(
        'https://apitest.hotelsetting.com/api/admin/blog-news/update/$id',
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer ${stringValue}'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }





}