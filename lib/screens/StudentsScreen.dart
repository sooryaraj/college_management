import 'package:flutter/material.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(),
      ),
    );
  }
}
