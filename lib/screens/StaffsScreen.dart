import 'package:college_management/utils/Utils.dart';
import 'package:flutter/material.dart';

class StaffsScreen extends StatelessWidget {
  const StaffsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: Utils.customAppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StaffDetailsTileHeader(),
              ],
            ),
          ),
        ));
  }
}

class StaffDetailsTileHeader extends StatelessWidget {
  const StaffDetailsTileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      height: MediaQuery.of(context).size.height * 0.6,
      // color: Colors.black87,
      child: Column(
        children: [
          Container(
            color: const Color(0xFF5e8193),
            height: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 30,
                  child: Text(
                    "ID",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Staff Name",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Qualification",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: StaffDetailsView())
        ],
      ),
    );
  }
}

class StaffDetailsView extends StatelessWidget {
  const StaffDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const StaffDetailsTile();
      },
    );
  }
}

class StaffDetailsTile extends StatelessWidget {
  const StaffDetailsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
          color: Colors.black87,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text(
              //   "Type",
              //   style: TextStyle(color: Colors.white),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "historyObj.date!",
                      style: TextStyle(color: Colors.white),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "histor",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "jkjgsfd",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "jkjgsfd",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "jkjgsfd",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "jkjgsfd",
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
