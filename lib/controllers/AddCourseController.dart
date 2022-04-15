import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/models/CoursesObj.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  var dao = LocalDatabaseDao();
  static final courseNameTextFieldController = TextEditingController();
  static final sectionNameTextFieldController = TextEditingController();
  static final staffNameTextFieldController = TextEditingController();

  var courseNameTxt = "".obs;
  var staffNameTxt = "".obs;
  var noSectionTxt = "".obs;

  Future<void> addCourseDetail() async {
    var _courseObjArr = <CoursesObj>[];
    int id = int.parse(await dao.getLastID(table: Screen.course) ?? "0");
    id = id + 1;
    var _courseObj = CoursesObj(
        id: id.toString(),
        courseName: courseNameTxt.value,
        staffName: staffNameTxt.value,
        noSection: noSectionTxt.value);
    print(_courseObj.toJson());
    _courseObjArr.add(_courseObj);
    dao.insertCourseList(_courseObjArr).then((value) => reset());
  }

  void reset() {
    courseNameTextFieldController.clear();
    sectionNameTextFieldController.clear();
    staffNameTextFieldController.clear();
  }
}
