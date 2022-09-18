import 'package:blog/ui/screenns/add_screen.dart';
import 'package:blog/ui/screenns/edit_screen.dart';
import 'package:blog/ui/screenns/test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/blog_controller.dart';
import '../../core/api_client.dart';
import '../../core/sharepref/MySharedPreferences.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController? dataController = Get.put(DataController());

  final ApiClient _apiClient = ApiClient();

  Future<void> postDelete(String id) async {
    if (id!="") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.postDelete(id);
      print(res);
      if (res['status'] == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Delete'),
          backgroundColor: Colors.green.shade300,
        ));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: Something Wrong'),
          backgroundColor: Colors.red.shade300,
        ));
      }

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',),
        centerTitle: true,),
      body: Obx(() => dataController!.isDataLoading!.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dataController!.user_model!.data!.blogs!.data!.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap:() =>{
              Get.to(() => const sss(),arguments:
              {
                'title':dataController!.user_model!.data!.blogs!.data![index].title!,
                'subtitle':dataController!.user_model!.data!.blogs!.data![index].subTitle!,
                'des':dataController!.user_model!.data!.blogs!.data![index].description!,
                'date':dataController!.user_model!.data!.blogs!.data![index].date!,
                'id': dataController!.user_model!.data!.blogs!.data![index].id.toString()!
              }

              )
            },
              child: Column(

                children: [

                  const SizedBox(
                    height: 10,
                  ),
                  Container(


                      margin: const EdgeInsets.only(left: 20,right: 20),
                      padding: const EdgeInsets.only(left: 20),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(dataController!.user_model!.data!.blogs!.data![index].title!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,

                                ),maxLines: 1, overflow: TextOverflow.ellipsis,
                                softWrap: true,),

                              Expanded(
                                  child: Container(
                                      child: Column(
                                          children: [
                                            Text(dataController!.user_model!.data!.blogs!.data![index].subTitle!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10
                                              ),maxLines: 1, overflow: TextOverflow.ellipsis,
                                              softWrap: true,),
                                          ]
                                      )
                                  )
                              ),



                              Expanded(
                                  child: Container(
                                      child: Column(
                                          children: [
                                            Text(dataController!.user_model!.data!.blogs!.data![index].description!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10
                                              ),maxLines: 1, overflow: TextOverflow.ellipsis,
                                              softWrap: true,),
                                          ]
                                      )
                                  )
                              ),
                              IconButton(
                                icon: new Icon(Icons.delete),
                                highlightColor: Colors.pink,
                                onPressed: (){
                                  postDelete(dataController!.user_model!.data!.blogs!.data![index].id.toString()!);

                                 dataController?.update();
                                  Get.to(HomeScreen());
                                  },
                              ),

                            ],
                          ),),




                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: () {
            Get.to(AddScreen());
          }
      ),
    );
  }
}
