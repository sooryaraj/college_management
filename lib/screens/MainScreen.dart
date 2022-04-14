import 'package:college_management/screens/StudentsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(const StudentsScreen());
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const StudentsScreen(),
            //       maintainState: false,
            //     ));
          },
          child: Column(
            children: [
              _dashboardButton(title: "Student"),
              _dashboardButton(title: "Student"),
              _dashboardButton(title: "Student")
            ],
          ),
        ),
      ],
    );
  }

  Widget _dashboardButton({required String title}) {
    return SizedBox(
      width: MediaQuery.of(Get.context!).size.width / 2,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(title),
        ),
      ),
    );
  }
}
