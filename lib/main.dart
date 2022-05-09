import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'Model/data_models.dart';
import 'Screens/home_page.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(ModelAdapter().typeId)) {
    Hive.registerAdapter(ModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        backgroundColor: Colors.grey[300],
      ),
      home:
          const Home(), //Home screen set as home page with student details,initially empty.
    );
  }
}
