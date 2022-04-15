import 'package:college_management/screens/CoursesScreen.dart';
import 'package:college_management/screens/StaffsScreen.dart';
import 'package:college_management/screens/StudentsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("College Management"),
        ),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentsScreen());
                  },
                  child: _dashboardButton(title: "Student", context: context),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StaffsScreen());
                  },
                  child: _dashboardButton(title: "Staffs", context: context),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CoursesScreen());
                  },
                  child: _dashboardButton(title: "Courses", context: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dashboardButton(
      {required String title, required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 55,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: const Color(0xff5e8193),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
