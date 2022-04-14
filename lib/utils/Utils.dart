import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:college_management/widgets/CameraWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';

import 'constant.dart';

class Utils {
  Utils._();

  static void displaySnackBar(String message) async {
    await Future.delayed(const Duration(milliseconds: 400));
    SnackBar(
      content: Text(message),
    );
  }

  static Widget placeholder() {
    return Image.asset(Const.placeholder);
  }

  static Widget loader() {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        height: 40.0,
        width: 40.0,
      ),
    );
  }

  static PreferredSizeWidget customAppBar() {
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

  static Widget loaderWithText(
      {required String msg, required BuildContext context}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          // color: Colors.black87,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                child: CircularProgressIndicator(),
                height: 30.0,
                width: 30.0,
              ),
              AutoSizeText(
                msg,
                maxFontSize: 22,
                minFontSize: 6,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget getIconButton(color, icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

        ///set you real bg color in your content
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  static Widget ErrorShimmerLoader() {
    return SizedBox(
      width: 50,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade400,
        child: const Text(
          'Loading',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static unfocus(context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Future<String> onImageButtonPressed(
      {BuildContext? context,
      required CameraType preferredCameraDevice,
      String? firedFrom}) async {
    String imgString = "";

    final imagePath = await Navigator.push(
      context!,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
          builder: (context) => CameraWidget(
                cameraPosition: preferredCameraDevice,
              )),
    );
    if (imagePath == null) {
      print('cancelled');
      imgString = "";
    } else {
      final bytes = File(imagePath).readAsBytesSync();
      imgString = base64.encode(bytes);
    }

    print(imagePath);
    return imgString;
  }

  static snackBarWithProgress(
      {required BuildContext context, required String msg}) {
    var _snackbar = SnackBar(
      content: Row(
        children: <Widget>[
          const SizedBox(
            child: CircularProgressIndicator(),
            height: 20.0,
            width: 20.0,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(msg)
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      _snackbar,
    );
  }

  static snackBar({required BuildContext context, required String msg}) {
    var _snackbar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).primaryColorLight,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      _snackbar,
    );
  }

  static String uuid() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
