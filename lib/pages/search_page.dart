import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:taiton/customs/custom_button.dart';
import 'package:taiton/pages/productdetail_page.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings.dart';
import 'package:taiton/utils/strings_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final fieldText = TextEditingController();
  TextEditingController textController = TextEditingController();
  void clearText() {
    fieldText.clear();
  }

  var onClick = 0;
  var selectedtab = 0;
  var index = 0;
  var Filter1 = [
    "Data 1",
    "Data 2",
    "Data 3",
    "Data 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackgroundColor,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteBoxColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 1),
                      ],
                      border: Border.all(
                        color: AppColors.backgroundColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: fieldText,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: clearText,
                                icon: Icon(Icons.clear,
                                    size: 15, color: AppColors.iconColor)),
                            hintText: 'Search here...',
                            hintStyle: TextStyle(
                              color: AppColors.lightTextColor,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ))),
          ),
          actions: [
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       onClick = 0;
            //     });
            //   },
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Container(
            //       width: Get.width - 50,
            //       child: Align(
            //         alignment: Alignment.centerRight,
            //         child: AnimSearchBar(
            //           width: Get.width - 50,
            //           textController: textController,
            //           onSuffixTap: () {
            //             setState(() {
            //               textController.clear();
            //             });
            //           },
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
                width: 50,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            onClick = 1;
                          });
                        },
                        icon: Icon(Icons.filter_alt_outlined,
                            color: AppColors.iconColor))))
          ],
          iconTheme: IconThemeData(color: AppColors.darkTextColor),
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Visibility(
                    visible: onClick == 0,
                    child: Container(
                        child: Column(children: [
                      //Search history
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Filter1.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Product or category name",
                                            style: StringsStyle.whiteTextStyle),
                                        Icon(Icons.clear,
                                            color: AppColors.whiteBoxColor)
                                      ]),
                                  Divider(color: AppColors.whiteBoxColor),
                                ]),
                              ),
                            );
                          }),
                      //Procut List
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(Strings.PROD_OR_CAT,
                                style: StringsStyle.whiteTextStyle),
                          ),
                          SizedBox(height: 10),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.85,
                              ),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ProductDetailPage(),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: DelayedDisplay(
                                        //  delay: Duration(seconds: 1),
                                        child: Card(
                                          elevation: 3,
                                          color: AppColors.whiteBoxColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                        color:
                                                            Colors.red[100])),
                                                Container(
                                                  color:
                                                      AppColors.whiteBoxColor,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: Text(
                                                          "Automatic Doors"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        ],
                      ),
                    ])))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Visibility(
                  visible: onClick == 1,
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteBoxColor,
                        border: Border.all(
                          color: AppColors.backgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteBoxColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.grey.shade300,
                          //       offset: Offset(0, 3),
                          //       blurRadius: 3,
                          //       spreadRadius: 1),
                          // ],
                          border: Border.all(
                            color: AppColors.backgroundColor,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("",
                                          style: StringsStyle.whiteTextStyle),
                                      Text("Filter",
                                          style: StringsStyle.whiteTextStyle),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            onClick = 0;
                                          });
                                        },
                                        child: Icon(Icons.clear,
                                            color: AppColors.whiteBoxColor),
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              height: Get.height / 1.5,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteBoxColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade500,
                                        borderRadius: BorderRadius.only(
                                            //  topLeft: Radius.circular(30),

                                            bottomLeft: Radius.circular(30))),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = 0;
                                            });
                                          },
                                          child: Container(
                                              height: 50,
                                              width: Get.width / 4,
                                              color: index == 0
                                                  ? AppColors.backgroundColor
                                                  : Colors.grey.shade500,
                                              child: Center(
                                                  child: Text("Filter 1",
                                                      style: StringsStyle
                                                          .whiteTextStyle))),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = 1;
                                            });
                                          },
                                          child: Container(
                                              height: 50,
                                              width: Get.width / 4,
                                              color: index == 1
                                                  ? AppColors.backgroundColor
                                                  : Colors.grey.shade500,
                                              child: Center(
                                                  child: Text("Filter 2",
                                                      style: StringsStyle
                                                          .whiteTextStyle))),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = 2;
                                            });
                                          },
                                          child: Container(
                                              height: 50,
                                              width: Get.width / 4,
                                              color: index == 2
                                                  ? AppColors.backgroundColor
                                                  : Colors.grey.shade500,
                                              child: Center(
                                                  child: Text("Filter 3",
                                                      style: StringsStyle
                                                          .whiteTextStyle))),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = 3;
                                            });
                                          },
                                          child: Container(
                                              height: 50,
                                              width: Get.width / 4,
                                              color: index == 3
                                                  ? AppColors.backgroundColor
                                                  : Colors.grey.shade500,
                                              child: Center(
                                                  child: Text("Filter 4",
                                                      style: StringsStyle
                                                          .whiteTextStyle))),
                                        ),
                                        Container(
                                          height: 150,
                                          width: Get.width / 4,
                                          color: Colors.grey.shade500,
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: index == 0,
                                    child: Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                primary: true,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: Filter1.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10, 20, 10, 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedtab = index;
                                                        });
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          30))),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        0),
                                                                child: Container(
                                                                    child: selectedtab ==
                                                                            index
                                                                        ? Icon(
                                                                            Icons
                                                                                .check_box,
                                                                            color: Colors
                                                                                .black)
                                                                        : Icon(
                                                                            Icons
                                                                                .check_box_outline_blank,
                                                                            color:
                                                                                Colors.black)),
                                                              ),
                                                              Text(
                                                                Filter1[index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Bounce(
                                                    duration: Duration(
                                                        milliseconds: 110),
                                                    onPressed: () {},
                                                    child: CustomButton(
                                                        text: "Apply",
                                                        width: 100,
                                                        height: 40),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text("Clear All",
                                                      style: StringsStyle
                                                          .darkTextStyle),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: index == 1,
                                    child: Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                primary: true,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: Filter1.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10, 20, 10, 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedtab = index;
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    10,
                                                                    0),
                                                            child: Container(
                                                                child: selectedtab ==
                                                                        index
                                                                    ? Icon(
                                                                        Icons
                                                                            .check_box,
                                                                        color: Colors
                                                                            .black)
                                                                    : Icon(
                                                                        Icons
                                                                            .check_box_outline_blank,
                                                                        color: Colors
                                                                            .black)),
                                                          ),
                                                          Text(
                                                            Filter1[index],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Bounce(
                                                    duration: Duration(
                                                        milliseconds: 110),
                                                    onPressed: () {},
                                                    child: CustomButton(
                                                        text: "Apply",
                                                        width: 100,
                                                        height: 40),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text("Clear All",
                                                      style: StringsStyle
                                                          .darkTextStyle),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: index == 2,
                                    child: Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                primary: true,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: Filter1.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10, 20, 10, 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedtab = index;
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    10,
                                                                    0),
                                                            child: Container(
                                                                child: selectedtab ==
                                                                        index
                                                                    ? Icon(
                                                                        Icons
                                                                            .check_box,
                                                                        color: Colors
                                                                            .black)
                                                                    : Icon(
                                                                        Icons
                                                                            .check_box_outline_blank,
                                                                        color: Colors
                                                                            .black)),
                                                          ),
                                                          Text(
                                                            Filter1[index],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Bounce(
                                                    duration: Duration(
                                                        milliseconds: 110),
                                                    onPressed: () {},
                                                    child: CustomButton(
                                                        text: "Apply",
                                                        width: 100,
                                                        height: 40),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text("Clear All",
                                                      style: StringsStyle
                                                          .darkTextStyle),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: index == 3,
                                    child: Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                primary: true,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: Filter1.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10, 20, 10, 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedtab = index;
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    10,
                                                                    0),
                                                            child: Container(
                                                                child: selectedtab ==
                                                                        index
                                                                    ? Icon(
                                                                        Icons
                                                                            .check_box,
                                                                        color: Colors
                                                                            .black)
                                                                    : Icon(
                                                                        Icons
                                                                            .check_box_outline_blank,
                                                                        color: Colors
                                                                            .black)),
                                                          ),
                                                          Text(
                                                            Filter1[index],
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                    ),
                                                  );
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Bounce(
                                                    duration: Duration(
                                                        milliseconds: 110),
                                                    onPressed: () {},
                                                    child: CustomButton(
                                                        text: "Apply",
                                                        width: 100,
                                                        height: 40),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text("Clear All",
                                                      style: StringsStyle
                                                          .darkTextStyle),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ))),
            )
          ],
        )));
  }
}
