import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/pages/about_page.dart';
import 'package:taiton/pages/contact_page.dart';
import 'package:taiton/pages/home_page.dart';

import 'package:taiton/pages/privacypolicy_page.dart';
import 'package:taiton/pages/search_page.dart';
import 'package:taiton/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
