import 'package:college_management/controllers/StudentScreenController.dart';
import 'package:college_management/models/StudentObj.dart';
import 'package:college_management/screens/AddStudentScreen.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final StudentScreenController _studentScreenController =
    Get.find<StudentScreenController>();

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Utils.unfocus(context);
          },
          child: Scaffold(
            floatingActionButton: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 31),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.small(
                      heroTag: "left",
                      onPressed: () {
                        _studentScreenController.loadStudentDetailsFromLocal();
                      },
                      child: const Icon(Icons.refresh),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.small(
                      heroTag: "right",
                      onPressed: () {
                        Get.to(() => const AddStudentScreen());
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            appBar: Utils.customAppBar(
                title: 'Students Details', page: Screen.student),
            body: const StaffDetailsTileHeader(),
          ),
        ));
  }
}

class StaffDetailsTileHeader extends StatelessWidget {
  const StaffDetailsTileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        height: height,
        // color: Colors.black87,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: Const.primaryColor,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.tileText(
                      text: "ID", width: width * 0.07, color: Colors.white),
                  Utils.tileText(
                      text: "Student Name",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Father Name",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Profile",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Email", width: width * 0.10, color: Colors.white),
                  Utils.tileText(
                      text: "Department",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "J.Date", width: width * 0.10, color: Colors.white),
                  Utils.tileText(
                      text: "TC", width: width * 0.10, color: Colors.white),
                  Utils.tileText(
                      text: "Aadhar No",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Address",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Staff Name",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Course", width: width * 0.10, color: Colors.white),
                  Utils.tileText(
                      text: "Section",
                      width: width * 0.10,
                      color: Colors.white),
                ],
              ),
            ),
            const Expanded(child: StaffDetailsView())
          ],
        ),
      ),
    );
  }
}

class StaffDetailsView extends StatefulWidget {
  const StaffDetailsView({Key? key}) : super(key: key);

  @override
  State<StaffDetailsView> createState() => _StaffDetailsViewState();
}

class _StaffDetailsViewState extends State<StaffDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _studentScreenController.loadStudentDetailsFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<StudentObj> _studentData = _studentScreenController.listStudents;
      if (_studentScreenController.status.value == RetriveState.success) {
        return RefreshIndicator(
          displacement: 50,
          backgroundColor: Const.primaryColor,
          color: Colors.white,
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            _studentScreenController.loadStudentDetails(reset: true);
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 70),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            itemCount: _studentData.length,
            itemBuilder: (BuildContext context, int index) {
              return StudentDetailsTile(
                data: _studentData[index],
              );
            },
          ),
        );
      } else if (_studentScreenController.status.value == RetriveState.error) {
        return Text(_studentScreenController.errorMessage.value);
      } else if (_studentScreenController.status.value == RetriveState.empty) {
        return const Center(
            child: Text(
          "Nothing Available",
          style: TextStyle(
              color: Colors.black12, fontSize: 30, fontWeight: FontWeight.bold),
        ));
      } else {
        return Utils.loader();
      }
    });
  }
}

class StudentDetailsTile extends StatelessWidget {
  const StudentDetailsTile({Key? key, required this.data}) : super(key: key);
  final StudentObj data;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
          // color: Colors.black87,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.tileText(
                  text: data.id ?? "",
                  width: width * 0.07,
                  color: Colors.black),
              Utils.tileText(
                  text: data.studentName ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.fatherName ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.profileImage ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.email!, width: width * 0.10, color: Colors.black),
              Utils.tileText(
                  text: data.department ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.joiningDate.toString(),
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.tcImage ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.addharcardNo.toString(),
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.address ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.staffName ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.courseName ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.section ?? "",
                  width: width * 0.10,
                  color: Colors.black),
            ],
          )),
    );
  }
}
