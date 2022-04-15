import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/models/StudentObj.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AddStudentController extends GetxController {
  var joiningDate = "".obs;
  static final joiningDateTextFieldController = TextEditingController();
  static final studentNameTextFieldController = TextEditingController();
  static final fatherNameTextFieldController = TextEditingController();
  static final emailTextFieldController = TextEditingController();
  static final departmentTextFieldController = TextEditingController();
  static final aadharTextFieldController = TextEditingController();
  static final addressTextFieldController = TextEditingController();

  var studentNameTxt = "".obs;
  var fatherNameTxt = "".obs;
  var emailTxt = "".obs;
  var departmentTxt = "".obs;
  var addharcardNoTxt = "".obs;
  var joiningDateTxt = "".obs;
  var addressTxt = "".obs;
  var dao = LocalDatabaseDao();
  Future<void> joiningDatePressed() async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      joiningDate.value = Jiffy(picked).format("yyyy-MM-dd");
      selectedDate = picked;
      joiningDateTextFieldController.text = joiningDate.value;
      joiningDateTxt.value = joiningDate.value;
    }
  }

  Future<void> addStudentDetail() async {
    var _studObjArr = <StudentObj>[];
    int id = int.parse(await dao.getLastID(table: Screen.student) ?? "0");
    id = id + 1;
    var _studObj = StudentObj(
        id: id.toString(),
        studentName: studentNameTxt.value,
        fatherName: fatherNameTxt.value,
        email: emailTxt.value,
        department: departmentTxt.value,
        addharcardNo: addharcardNoTxt.value,
        joiningDate: joiningDateTxt.value,
        address: addressTxt.value);
    print(_studObj.toJson());
    _studObjArr.add(_studObj);
    dao.insertStudentList(_studObjArr).then((value) => reset());
  }

  void reset() {
    studentNameTextFieldController.clear();
    fatherNameTextFieldController.clear();
    emailTextFieldController.clear();
    aadharTextFieldController.clear();
    departmentTextFieldController.clear();
    addressTextFieldController.clear();
    joiningDateTextFieldController.clear();

    studentNameTxt.value = "";
    fatherNameTxt.value = "";
    emailTxt.value = "";
    departmentTxt.value = "";
    addharcardNoTxt.value = "";
    joiningDateTxt.value = "";
    addressTxt.value = "";
  }
}
