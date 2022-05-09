import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Database/db_datas.dart';
import '../Model/data_models.dart';

class FormHome extends StatelessWidget {
  final name = TextEditingController();
  final age = TextEditingController();
  final number = TextEditingController();
  final place = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  FormHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Getimage _control = Get.put(Getimage());

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Center(
                  child: Text(
                    'Student Details',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 35.0,
                      fontFamily: "Lobster",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 20.0),
                child: Card(
                  elevation: 5.0,
                  color: Colors.purple[100],
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        //Default Image changes to user image from Memory image/Gallery
                        GestureDetector(
                          onTap: () async {
                            _control.addimage();
                          },
                          child: GetBuilder<Getimage>(builder: (ctxt) {
                            return CircleAvatar(
                              backgroundImage:
                                  Image.asset('assets/image/addimage.png')
                                      .image,
                              radius: 40.0,
                              child: img.trim().isNotEmpty
                                  ? CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: MemoryImage(
                                        const Base64Decoder().convert(img),
                                      ),
                                    )
                                  : Container(),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50.0,
                            bottom: 40.0,
                            top: 20.0,
                            left: 40.0,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Field';
                              } else {
                                return null;
                              }
                            },
                            controller: name,
                            decoration: const InputDecoration(
                              hintText: 'Student Name:',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 50.0, bottom: 40.0, left: 40.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Field';
                              } else {
                                return null;
                              }
                            },
                            controller: age,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Age:',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50.0,
                            bottom: 40.0,
                            left: 40.0,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Field';
                              } else {
                                return null;
                              }
                            },
                            controller: number,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Phone Number:',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50.0,
                            bottom: 40.0,
                            left: 40.0,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Field';
                              } else {
                                return null;
                              }
                            },
                            controller: place,
                            decoration: const InputDecoration(
                              hintText: 'Place:',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Back'),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple,
                              ),
                              onPressed: () {
                                submit(context);
                                _formkey.currentState!.validate();
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    final _name = name.text.trim();
    final _age = age.text.trim();
    final _number = number.text.trim();
    final _place = place.text.trim();
    final imag = img;

    final obj = Model(
        name: _name,
        age: _age,
        phonenumber: _number,
        place: _place,
        img: imag,
        id: null);

    if (_name.isEmpty ||
        _age.isEmpty ||
        _number.isEmpty ||
        _place.isEmpty ||
        imag.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
              title: const Text(
                'Details incomplete, Please fill all fields ',
                style: TextStyle(color: Colors.deepPurple, fontSize: 15.0),
              ),
            );
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[300],
          content: const Text('success! Details added to  list'),
        ),
      );
      Addstudent(obj);
    }
  }
}
