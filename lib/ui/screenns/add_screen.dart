import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/api_client.dart';
import '../../utils/validator.dart';
import 'home_screen.dart';

class AddScreen extends StatefulWidget {
  static String id = "edit_screen";
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  Future<void> postUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));
      Random random = Random();

      var _randomNumber1 = random.nextInt(50000);

      Map<String, dynamic> userData = {



        "title": titleController.text,
        "sub_title": subtitleController.text,
        "description": descriptionController.text,
        "date": dateController.text,
        "slug": "stest",

      };

      dynamic res = await _apiClient.postUser(userData);
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
                    controller: titleController,
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
                    controller: subtitleController,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: descriptionController,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: dateController,
                    keyboardType: TextInputType.emailAddress,
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
                      onPressed: () => postUsers(),
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
