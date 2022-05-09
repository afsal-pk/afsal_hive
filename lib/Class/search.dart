import 'package:afsal_hive/Database/db_datas.dart';
import 'package:afsal_hive/Screens/student_full_details.dart';
import 'package:flutter/material.dart';
import '../Model/data_models.dart';

class SearchDetail extends SearchDelegate {
  Model? data;

  SearchDetail({this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = ' ';
            }
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: StudentList,
        builder: (BuildContext ctx, List<Model> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final datas = studentList[index];
              if (datas.name.toLowerCase().contains(query.toLowerCase())) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.purple[100],
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            (MaterialPageRoute(builder: (ctx) {
                              return FullDetails(datas: datas, index: index);
                            })),
                            (route) => true);
                      },
                      title: Text(
                        datas.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
            separatorBuilder: (ctx, value) {
              return Divider(
                thickness: 2.0,
                color: Colors.purple[300],
              );
            },
            itemCount: studentList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: StudentList,
        builder: (BuildContext ctx, List<Model> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final datas = studentList[index];
              if (query == datas.name[index].toLowerCase()) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.purple[100],
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      onTap: () {
                        Navigator.of(context).push(
                          (MaterialPageRoute(builder: (ctx) {
                            return FullDetails(datas: datas, index: index);
                          })),
                        );
                        //  (route) => false);
                      },
                      title: Text(
                        datas.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
            separatorBuilder: (ctx, value) {
              return const SizedBox(
                width: 0,
              );
            },
            itemCount: studentList.length,
          );
        });
  }
}
