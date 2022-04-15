import 'package:college_management/helpers/LocalDatabaseDao.dart';
import 'package:college_management/models/StaffObj.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStaffScreenControler extends GetxController {
  static final staffNameTextFieldController = TextEditingController();
  static final qualificationTextFieldController = TextEditingController();
  static final emailTextFieldController = TextEditingController();
  static final phoneTextFieldController = TextEditingController();

  var dao = LocalDatabaseDao();

  Future<void> addStudentDetail() async {
    var _staffObjArr = <StaffObj>[];
    int id = int.parse(await dao.getLastID(table: Screen.staff) ?? "0");
    id = id + 1;
    var _staffObj = StaffObj(
        id: id.toString(),
        staffName: staffNameTextFieldController.value.text,
        qualification: qualificationTextFieldController.value.text,
        phone: phoneTextFieldController.value.text,
        email: emailTextFieldController.value.text);
    _staffObjArr.add(_staffObj);
    print(_staffObj.toJson());
    dao.insertStaffList(_staffObjArr).then((value) => reset());
  }

  void reset() {
    staffNameTextFieldController.clear();
    qualificationTextFieldController.clear();
    emailTextFieldController.clear();
    phoneTextFieldController.clear();
  }
}
