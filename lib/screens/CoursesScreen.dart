import 'package:college_management/controllers/CourseScreenController.dart';
import 'package:college_management/models/CoursesObj.dart';
import 'package:college_management/screens/AddCourseScreen.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CourseScreenController _courseScreenController =
    Get.find<CourseScreenController>();

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

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
                      _courseScreenController.loadCourseDetailsFromLocal();
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
                      Get.to(() => const AddCourseScreen());
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          appBar:
              Utils.customAppBar(title: 'Course Details', page: Screen.course),
          body: const StaffDetailsTileHeader(),
        ),
      ),
    );
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Utils.tileText(
                      text: "ID", width: width * 0.7, color: Colors.white),
                  Utils.tileText(
                      text: "Course Name",
                      width: width * 0.20,
                      color: Colors.white),
                  Utils.tileText(
                      text: "No Of Section",
                      width: width * 0.20,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Staff Name",
                      width: width * 0.20,
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
    // _courseScreenController.loadCourseDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<CoursesObj> _courseData = _courseScreenController.listCourse;
      print("_courseData ${_courseData.length}");
      if (_courseScreenController.status.value == RetriveState.success) {
        return RefreshIndicator(
          displacement: 50,
          backgroundColor: Const.primaryColor,
          color: Colors.white,
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            _courseScreenController.loadCourseDetails(reset: true);
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 125),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            itemCount: _courseData.length,
            itemBuilder: (BuildContext context, int index) {
              return CourseDetailsTile(
                data: _courseData[index],
              );
            },
          ),
        );
      } else if (_courseScreenController.status.value == RetriveState.error) {
        return Text(_courseScreenController.errorMessage.value);
      } else if (_courseScreenController.status.value == RetriveState.empty) {
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

class CourseDetailsTile extends StatelessWidget {
  const CourseDetailsTile({Key? key, required this.data}) : super(key: key);
  final CoursesObj data;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Utils.tileText(
                  text: data.id ?? "",
                  width: width * 0.07,
                  color: Colors.black),
              Utils.tileText(
                  text: data.courseName ?? "",
                  width: width * 0.20,
                  color: Colors.black),
              Utils.tileText(
                  text: data.noSection ?? "",
                  width: width * 0.20,
                  color: Colors.black),
              Utils.tileText(
                  text: data.staffName ?? "",
                  width: width * 0.20,
                  color: Colors.black),
            ],
          )),
    );
  }
}
