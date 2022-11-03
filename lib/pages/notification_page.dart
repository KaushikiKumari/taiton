import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings.dart';
import 'package:taiton/utils/strings_style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        iconTheme: IconThemeData(color: AppColors.iconColor),
        title: Text("Notifications", style: StringsStyle.darkTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              primary: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return DelayedDisplay(
                    // delay: Duration(seconds: 1),
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                      elevation: 3,
                      color: AppColors.whiteBoxColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Test Notification",
                                style: StringsStyle.darkTextStyle),
                            SizedBox(height: 5),
                            Text(
                                "Lorem ipsum is a placeholder text commonly used to",
                                style: StringsStyle.lightTextStyle),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("09:00 am | 17 Aug, 2021",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))
                                ])
                          ],
                        ),
                      )),
                ));
              }),
        ),
      ),
    );
  }
}
