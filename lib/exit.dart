import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showExitPopup(context) async {
  return await Alert(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
    closeIcon: const SizedBox(),
    context: context,
    type: AlertType.none,
    // title: "Do you want to exit?",
    style: AlertStyle(
      backgroundColor: Colors.white,
      titleStyle: TextStyle(
        fontSize: 20.sp,
      ),
    ),
    content: Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            child: Text(
          "Do you want to exit?",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
          ),
        )),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        color: Colors.lightBlue,
        child: Text(
          "No",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      DialogButton(
        onPressed: () {
          try {
            exit(0);
          } catch (e) {
            print(e);
          }
        },
        color: Colors.lightBlue,
        child: Text(
          "Yes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
        ),
      )
    ],
  ).show();
}
