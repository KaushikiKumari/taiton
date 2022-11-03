import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/pages/home_page.dart';
import 'package:taiton/utils/colors.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  dynamic data = [];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteBoxColor,
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash_image.png"),
                        fit: BoxFit.fill)))));
  }
}
