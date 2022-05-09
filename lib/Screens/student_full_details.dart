import 'dart:convert';
import 'package:afsal_hive/Model/data_models.dart';
import 'package:afsal_hive/Screens/student_detail_edit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullDetails extends StatelessWidget {
  Model datas;
  int index;

  FullDetails({Key? key, required this.datas, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Student Details',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "Roboto",
            color: Colors.orange,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return Edit(datas: datas, index2: index);
                  }),
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 20.0,
              )),
        ],
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 30.0, right: 30.0, bottom: 60.0),
          child: Card(
            elevation: 5.0,
            color: Colors.purple[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(datas.img!)),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Name  :   ${datas.name}",
                    style: const TextStyle(
                      fontFamily: "Roboto-Regular",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Age :    ${datas.age}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Number :  ${datas.phonenumber}  ",
                    style: const TextStyle(
                      fontFamily: "Roboto-Regular",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    "Place :  ${datas.place}",
                    style: const TextStyle(
                      fontFamily: "Roboto-Regular",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Back")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
