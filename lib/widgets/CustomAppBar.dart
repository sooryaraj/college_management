import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(),
      ),
      toolbarHeight: 80,

      centerTitle: true,

      title: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              // width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.ltr,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset("assets/images/profile.png"),
        ],
      ),
      // ...
    );
  }
}
