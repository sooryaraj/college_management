import 'package:college_management/controllers/StaffScreenController.dart';
import 'package:college_management/models/StaffObj.dart';
import 'package:college_management/screens/AddStaffScreen.dart';
import 'package:college_management/utils/Utils.dart';
import 'package:college_management/utils/constant.dart';
import 'package:college_management/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final StaffScreenControler _staffScreenControler =
    Get.find<StaffScreenControler>();

class StaffsScreen extends StatelessWidget {
  const StaffsScreen({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(left: 31),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.small(
                      onPressed: () {
                        _staffScreenControler.loadCourseDetailsFromLocal();
                      },
                      heroTag: "left",
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
                        Get.to(() => const AddStaffScreen());
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            appBar:
                Utils.customAppBar(title: 'Staff Details', page: Screen.staff),
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
                      text: "Staff Name",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Qualification",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Email", width: width * 0.10, color: Colors.white),
                  Utils.tileText(
                      text: "Phone Number",
                      width: width * 0.10,
                      color: Colors.white),
                  Utils.tileText(
                      text: "Profile",
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
    // _staffScreenControler.loadstaffDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<StaffObj> _staffData = _staffScreenControler.listStaffs;
      if (_staffScreenControler.status.value == RetriveState.success) {
        return RefreshIndicator(
          displacement: 50,
          backgroundColor: Const.primaryColor,
          color: Colors.white,
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            _staffScreenControler.loadstaffDetails(reset: true);
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 125),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            itemCount: _staffData.length,
            itemBuilder: (BuildContext context, int index) {
              return StaffDetailsTile(
                data: _staffData[index],
              );
            },
          ),
        );
      } else if (_staffScreenControler.status.value == RetriveState.error) {
        return Text(_staffScreenControler.errorMessage.value);
      } else if (_staffScreenControler.status.value == RetriveState.empty) {
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

class StaffDetailsTile extends StatelessWidget {
  const StaffDetailsTile({Key? key, required this.data}) : super(key: key);
  final StaffObj data;
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.tileText(
                      text: data.id!, width: width * 0.07, color: Colors.black),
                ],
              ),
              Utils.tileText(
                  text: data.staffName ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.qualification ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.email ?? "",
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.phone.toString(),
                  width: width * 0.10,
                  color: Colors.black),
              Utils.tileText(
                  text: data.profileImage.toString(),
                  width: width * 0.10,
                  color: Colors.black),
            ],
          )),
    );
  }
}
