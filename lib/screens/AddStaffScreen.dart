import 'package:college_management/controllers/AddStaffScreenController.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();
final AddStaffScreenControler _addStaffScreenControler =
    Get.find<AddStaffScreenControler>();

class AddStaffScreen extends StatelessWidget {
  const AddStaffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Utils.unfocus(context);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            floatingActionButton: showFab
                ? Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 31),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.grey.shade500,
                            heroTag: "left",
                            onPressed: () {
                              _addStaffScreenControler.reset();
                            },
                            label: const Text("Reset"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.green.shade700,
                            heroTag: "right",
                            onPressed: () {
                              _addStaffScreenControler.emailTxt.value =
                                  AddStaffScreenControler
                                      .emailTextFieldController.text;
                              print(_addStaffScreenControler.emailTxt.value);
                              ;
                              if (_formKey.currentState!.validate()) {
                                _addStaffScreenControler.addStudentDetail();

                                Utils.displaySnackBar("Staff Added");
                              }
                            },
                            label: const Text("Submit"),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
            appBar: AppBar(
              title: const Text('Add Staff'),
              centerTitle: true,
            ),
            body: const StudentsForm(),
          ),
        ));
  }
}

class StudentsForm extends StatelessWidget {
  const StudentsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Staff Name",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller:
                          AddStaffScreenControler.staffNameTextFieldController,
                      // The validator receives the text that the user has entered.
                      onChanged: (value) {
                        _addStaffScreenControler.staffNameTxt.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter staff name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Qualification",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: AddStaffScreenControler
                          .qualificationTextFieldController,
                      onChanged: (value) {
                        _addStaffScreenControler.qualificationTxt.value = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter qualification';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller:
                          AddStaffScreenControler.emailTextFieldController,
                      onChanged: (value) {
                        _addStaffScreenControler.emailTxt.value = value;
                        print(_addStaffScreenControler.emailTxt.value);
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter father name';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      controller:
                          AddStaffScreenControler.phoneTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        } else if (GetUtils.isPhoneNumber(value)) {
                          return 'Please check mobile number format';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
