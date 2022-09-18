import 'dart:convert';
import 'dart:developer';

import 'package:blog/core/data/model/bloglist.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../core/sharepref/MySharedPreferences.dart';

class DataController extends GetxController {
  BlogList? user_model;

  var isDataLoading = false.obs;



  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  //admin/blog-news/store

  getApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stringValue = prefs.getString('stringValue');
    try{
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://apitest.hotelsetting.com/api/admin/blog-news')!,
          headers: {
            'Authorization': 'Bearer ${stringValue}'}
      );
      if(response.statusCode == 200){
        ///data successfully

        var result = jsonDecode(response.body);

        print(result);
        user_model =  BlogList.fromJson(result);
      }else{
        ///error
      }
    }catch(e){
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }
}
