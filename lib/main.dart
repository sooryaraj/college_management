import 'package:college_management/controllers/CourseScreenController.dart';
import 'package:college_management/controllers/StaffScreenController.dart';
import 'package:college_management/controllers/StudentScreenController.dart';
import 'package:college_management/helpers/data_base.dart';
import 'package:college_management/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppDatabase.instance.database;
  Get.put(StaffScreenControler());
  Get.put(CourseScreenController());
  Get.put(StudentScreenController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'College Management',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MainScreen(),
    );
  }
}
