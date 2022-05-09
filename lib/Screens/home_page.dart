import 'dart:convert';
import 'package:flutter/material.dart';
import '../Class/search.dart';
import '../Database/db_datas.dart';
import '../Model/data_models.dart';
import 'student_add_form.dart';
import 'student_full_details.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getallDetails();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: StudentList,
        builder: (BuildContext ctx, List<Model> studentList, Widget? child) {
          return Scaffold(
            //Appbar section
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text(
                'Student Manager',
                style: TextStyle(
                  fontSize: 32.0,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchDetail(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.orange,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.grey[300],

            // Body section with Student details shows, List generates with user entry.
            body: SafeArea(
              child: ListView.separated(
                itemBuilder: (ctx, value) {
                  final datas = studentList[value];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 5.0,
                      color: Colors.purple[300],
                      shadowColor: Colors.black87,
                      child: ListTile(
                        //Shows picked image from gallery
                        leading: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: MemoryImage(
                            const Base64Decoder().convert(datas.img!),
                          ),
                        ),

                        // Delete button , Delete function called
                        trailing: IconButton(
                          onPressed: () async {
                            Deleting(value);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),

                        //Student Full details
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) {
                                return FullDetails(
                                  datas: datas,
                                  index: value,
                                );
                              },
                            ),
                          );
                        },
                        subtitle: const Text("More Details >>"),
                        title: Text(
                          datas.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, value) {
                  return Divider(
                    thickness: 2.0,
                    color: Colors.purple[300],
                  );
                },
                itemCount: studentList.length,
              ),
            ),
          );
        },
      ),

      // Add student details by clicking button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.orange,
        ),
        onPressed: () {
          img = '';
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) {
              return FormHome();
            }),
          );
        },
      ),
    );
  }
}
