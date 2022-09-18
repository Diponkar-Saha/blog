import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/api_client.dart';
import '../../utils/validator.dart';
import 'home_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  var data = Get.arguments;
  final ApiClient _apiClient = ApiClient();

  Future<void> editPost(String id) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));


      Map<String, dynamic> userData = {
        "title": titleController.text,
        "sub_title": subtitleController.text,
        "description": descriptionController.text,
        "date": dateController.text,
        "slug": "stest",
      };

      dynamic res = await _apiClient.editPost(userData,id);
      print(res);
      if (res['status'] == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Blog',),
        centerTitle: true,),
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Container(
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),

            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (value) =>
                        Validator.validateText(value ?? ""),
                    controller: titleController.text=data[0],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Title",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (value) =>
                        Validator.validateText(value ?? ""),
                    controller: subtitleController.text=data[1],

                    decoration: InputDecoration(
                      hintText: "Sub Title",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(

                    validator: (value) =>
                        Validator.validateText(value ?? ""),
                    controller: descriptionController.text=data[2],
                    decoration: InputDecoration(
                      hintText: "Description",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                    maxLines: 5, // <-- SEE HERE
                    minLines: 1,
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (value) =>
                        Validator.validateText(value ?? ""),
                    controller: dateController.text=data[3],

                    decoration: InputDecoration(
                      hintText: "Date",
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => editPost(data[4]),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),
          )
          ,



        ),

      ),
    );
  }
}
