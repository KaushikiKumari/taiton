import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/pages/notification_page.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings_style.dart';

class CatlogPage extends StatefulWidget {
  const CatlogPage({Key? key}) : super(key: key);

  @override
  _CatlogPageState createState() => _CatlogPageState();
}

class _CatlogPageState extends State<CatlogPage> {
  double indicatorPosition = 0;
  var isSelect = 0;
  int length = 5;
  changeIndicatorPosition() {
    Timer(Duration(seconds: 3), () {
      print("changed");
      if (indicatorPosition != 4) {
        setState(() {
          indicatorPosition++;
        });
      } else {
        setState(() {
          indicatorPosition = 0;
        });
      }
      changeIndicatorPosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.indigo),
        backgroundColor: AppColors.appBarBackgroundColor,
        centerTitle: true,
        title: Container(width: 120, height: 50, color: Colors.red),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(NotificationPage(), transition: Transition.rightToLeft);
              },
              icon: Icon(Icons.notifications, size: 30)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _sliderView(),
            SizedBox(height: 15),
            _productHeaderView(),
            SizedBox(height: 15),
            _productListView(),
          ],
        ),
      ),
    );
  }

  _sliderView() {
    return Column(
      children: [
        Container(
          height: 180,
          width: Get.width,
          child: CarouselSlider(
            items: [
              for (int i = 0; i < length; i++)
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    // image: DecorationImage(
                    //     image: i % 2 == 0
                    //         ? AssetImage(
                    //             "assets/images/sliderone.jpg",
                    //           )
                    //         : AssetImage(
                    //             "assets/images/slidertwo.jpg",
                    //           ),
                    //     fit: BoxFit.fitWidth),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
            ],
            options: CarouselOptions(
              autoPlayInterval: Duration(milliseconds: 3000),
              autoPlay: true,
              height: Get.height / 3.5,
              enlargeCenterPage: true,
              viewportFraction: 1,
              initialPage: 2,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: new DotsIndicator(
            dotsCount: 5,
            position: indicatorPosition,
            decorator: DotsDecorator(
              size: const Size(15.0, 7.0),
              activeSize: const Size(50.0, 7.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          height: 20,
        )
      ],
    );
  }

  _productHeaderView() {
    return SizedBox(
        width: Get.width,
        height: Get.height / 7,
        child: Card(
          elevation: 3,
          color: AppColors.whiteBoxColor,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        isSelect = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                      child: Container(
                        //height: Get.height / 7,
                        width: Get.width / 2.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: isSelect == index
                                ? AppColors.iconColor
                                : AppColors.whiteBoxColor,
                            boxShadow: [
                              BoxShadow(
                                color: isSelect == index
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.iconColor),
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteBoxColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: isSelect == index
                                            ? Colors.transparent
                                            : Colors.grey.shade300,
                                        spreadRadius: 1,
                                        offset: Offset(0, 3),
                                        blurRadius: 3,
                                      )
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                  width: 100,
                                  child: Text(
                                    "Automatic Doors",
                                    maxLines: 2,
                                    style: isSelect == index
                                        ? TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    //maxlines: 2
                                  )),
                            )
                          ]),
                        ),
                      ),
                    ));
              }),
        ));
  }

  _productListView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DelayedDisplay(
                        // delay: Duration(seconds: 1),
                        child: Card(
                      elevation: 4,
                      color: AppColors.whiteBoxColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.iconColor),
                                      shape: BoxShape.circle,
                                      color: AppColors.whiteBoxColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1,
                                          offset: Offset(0, 3),
                                          blurRadius: 3,
                                        )
                                      ])),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      "Automatic Doors & Electric Locks",
                                      maxLines: 2,
                                      style: StringsStyle.darkTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                      //maxlines: 2
                                    )),
                              )
                            ]),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.keyboard_arrow_right_outlined,
                                  color: AppColors.iconColor),
                            )
                          ],
                        ),
                      ),
                    ))));
          }),
    );
  }
}
