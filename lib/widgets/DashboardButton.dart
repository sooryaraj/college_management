import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("assets/images/membership.webp"),
              SizedBox(
                height: 15,
              ),
              Text("View Task"),
            ],
          ),
        ),
      ),
    );
  }
}
