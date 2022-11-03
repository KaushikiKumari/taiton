import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:taiton/customs/custom_button.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings.dart';
import 'package:taiton/utils/strings_style.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackgroundColor,
          iconTheme: IconThemeData(color: AppColors.darkTextColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Card(
                elevation: 3,
                color: AppColors.whiteBoxColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        Strings.CONTACT,
                        style: StringsStyle.darkTextStyle,
                      ),
                      SizedBox(height: 20),
                      Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _nameCard(),
                                SizedBox(height: 10),
                                _emailCard(),
                                SizedBox(height: 10),
                                _phoneCard(),
                                SizedBox(height: 10),
                                _messageCard(),
                                SizedBox(height: 20),
                                _sendButon()
                              ]))
                    ],
                  ),
                )),
          ),
        ));
  }

  _nameCard() {
    return SizedBox(
        width: Get.width,
        height: 50,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteBoxColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 1),
              ],
              border: Border.all(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    errorBorder:
                        new OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please, enter your name";
                    }
                    return null;
                  },
                ),
              ),
            )));
  }

  _emailCard() {
    return SizedBox(
        width: Get.width,
        height: 55,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteBoxColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 1),
              ],
              border: Border.all(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    errorBorder:
                        new OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please, enter your email";
                    }
                    return null;
                  },
                ),
              ),
            )));
  }

  _phoneCard() {
    return SizedBox(
        width: Get.width,
        height: 55,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteBoxColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 1),
              ],
              border: Border.all(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    errorBorder:
                        new OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please, enter your phone";
                    }
                    return null;
                  },
                ),
              ),
            )));
  }

  _messageCard() {
    return SizedBox(
        width: Get.width,
        height: 55,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteBoxColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 1),
              ],
              border: Border.all(
                color: AppColors.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    hintStyle: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    errorBorder:
                        new OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please, enter your message";
                    }
                    return null;
                  },
                ),
              ),
            )));
  }

  _sendButon() {
    return Center(
      child: Bounce(
          duration: Duration(milliseconds: 110),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.back();
              // Get.snackbar("Profile Updated", "Your profile has been updated",
              //     backgroundColor: AppColors.whiteboxColor,
              //     borderRadius: 5,
              //     snackPosition: SnackPosition.TOP,
              //     margin: EdgeInsets.all(10),
              //     boxShadows: [
              //       BoxShadow(
              //           blurRadius: 3,
              //           color: Colors.grey.shade400,
              //           spreadRadius: 1,
              //           offset: Offset(0, 3))
              //     ],
              //     colorText: AppColors.buttonColor);
            }
          },
          child: CustomButton(text: "Send", width: 150, height: 45)),
    );
  }
}
