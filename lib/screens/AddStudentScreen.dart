import 'package:college_management/controllers/AddStudentController.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();
final AddStudentController _addStudentController =
    Get.find<AddStudentController>();

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

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
                              _addStudentController.reset();
                              Utils.displaySnackBar("Reset button pressed");
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
                              if (_formKey.currentState!.validate()) {
                                _addStudentController.addStudentDetail();
                                Utils.displaySnackBar("Student Added");
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
              title: const Text('Add Student'),
              centerTitle: true,
            ),
            body: const StudentsForm(),
          ),
        ));
  }
}

class StudentsForm extends StatefulWidget {
  const StudentsForm({Key? key}) : super(key: key);

  @override
  State<StudentsForm> createState() => _StudentsFormState();
}

class _StudentsFormState extends State<StudentsForm> {
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
                    "Student Name",
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
                          AddStudentController.studentNameTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter student name';
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
                    "Father Name",
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
                          AddStudentController.fatherNameTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter father name';
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

                      controller: AddStudentController.emailTextFieldController,
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
                    "Department",
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
                          AddStudentController.departmentTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter department name';
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
                    "Aadhar Card No",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      controller:
                          AddStudentController.aadharTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter aadhar card number';
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
                    "Address",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller:
                          AddStudentController.addressTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 12, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Joining Date",
                    style: TextStyle(color: Const.primaryColor),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white60,
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller:
                          AddStudentController.joiningDateTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 20), // add padding to adjust text
                        isDense: true,
                        hintText: "",
                        suffixIcon: InkWell(
                          onTap: () async {
                            _addStudentController.joiningDatePressed();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
