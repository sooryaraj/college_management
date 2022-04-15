import 'package:college_management/controllers/CourseScreenController.dart';
import 'package:college_management/controllers/StaffScreenController.dart';
import 'package:college_management/controllers/StudentScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  Utils._();

  static final CourseScreenController _courseScreenController =
      Get.find<CourseScreenController>();
  static final StaffScreenControler _staffScreenControler =
      Get.find<StaffScreenControler>();
  static final StudentScreenController _studentScreenController =
      Get.find<StudentScreenController>();

  static void displaySnackBar(String message) async {
    await Future.delayed(const Duration(milliseconds: 400));
    var _snackbar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      _snackbar,
    );
  }

  static Widget loader() {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 40.0,
        width: 40.0,
      ),
    );
  }

  static PreferredSizeWidget customAppBar(
      {required String title, required String page}) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,

      centerTitle: true,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Flexible(
                flex: 1,
                child: Container(
                  // width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (q) {
                      if (page == 'staff') {
                        _staffScreenControler.loadCourseDetailsFromLocal(
                            where: q);
                      } else if (page == 'student') {
                        _studentScreenController.loadStudentDetailsFromLocal(
                            where: q);
                      } else if (page == 'course') {
                        _courseScreenController.loadCourseDetailsFromLocal(
                            where: q);
                      }
                    },
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintTextDirection: TextDirection.ltr,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/images/profile.png"),
            ],
          ),
          Text(title)
        ],
      ),
      // ...
    );
  }

  static Widget tileText(
      {required String text, required double width, required Color color}) {
    return Flexible(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            text,
            style: TextStyle(color: color),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  static unfocus(context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
