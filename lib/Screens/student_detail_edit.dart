import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database/db_datas.dart';
import '../Model/data_models.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class Edit extends StatelessWidget {
  int index2;
  Model datas;
  Edit({Key? key, required this.datas, required this.index2}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final name = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final place = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Getimage _control = Get.put(Getimage());
    name.text = datas.name;
    age.text = datas.age;
    phone.text = datas.phonenumber;
    place.text = datas.place;
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'Update Student Details',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20.0,
                  fontFamily: "Roboto-Regular",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      _control.addimage();
                    },
                    child: GetBuilder<Getimage>(builder: (ctxt) {
                      return CircleAvatar(
                        radius: 40.0,
                        child: img.trim().isNotEmpty
                            ? CircleAvatar(
                                radius: 50.0,
                                backgroundImage: MemoryImage(
                                  const Base64Decoder().convert(img),
                                ),
                              )
                            : CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    Image.asset('assets/image/addimage.png')
                                        .image,
                              ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Box is Empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Student Name:',
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Box is Empty";
                      } else {
                        return null;
                      }
                    },
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Box is Empty";
                      } else {
                        return null;
                      }
                    },
                    controller: phone,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number :',
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Box is Empty";
                      } else {
                        return null;
                      }
                    },
                    controller: place,
                    decoration: const InputDecoration(
                      hintText: 'Place',
                      labelText: 'Place',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      submit(context);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (ctx) {
                        return const Home();
                      }), (route) => false);
                    },
                    child: const Text('Update'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void submit(BuildContext context) async {
    final _name = name.text;
    final _age = age.text;
    final _number = phone.text;
    final _place = place.text;
    final _image = img;
    final obj = Model(
        name: _name,
        age: _age,
        phonenumber: _number,
        place: _place,
        id: null,
        img: _image);
    await updateItem(index2, obj);
  }
}
