import 'package:college_management/controllers/AddCourseController.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();
final AddCourseController _addCourseController =
    Get.find<AddCourseController>();

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

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
                              _addCourseController.reset();
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
                                _addCourseController.addCourseDetail();
                                Utils.displaySnackBar("Course Added");
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
              title: const Text('Add Course'),
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
                    "Course Name",
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
                          AddCourseController.courseNameTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter course name';
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
                          AddCourseController.staffNameTextFieldController,

                      // The validator receives the text that the user has entered.
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
                    "Section",
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
                          AddCourseController.sectionNameTextFieldController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter section name';
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
