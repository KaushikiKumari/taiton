import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/pages/about_page.dart';
import 'package:taiton/pages/catlog_page.dart';
import 'package:taiton/pages/contact_page.dart';
import 'package:taiton/pages/notification_page.dart';
import 'package:taiton/pages/privacypolicy_page.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings_style.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: Get.height,
      child: Drawer(
        child: Container(
          color: AppColors.backgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 100),
              ListTile(
                leading: Icon(Icons.home_outlined,
                    size: 30, color: AppColors.whiteBoxColor),
                title: const Text('Home', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline,
                    size: 30, color: AppColors.whiteBoxColor),
                title: const Text('About', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.to(AboutPage(), transition: Transition.rightToLeft);
                },
              ),
              ListTile(
                leading: Icon(Icons.note_alt_outlined,
                    size: 30, color: AppColors.whiteBoxColor),
                title:
                    const Text('Catalog', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.to(CatlogPage(), transition: Transition.rightToLeft);
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications_active_outlined,
                    size: 30, color: AppColors.whiteBoxColor),
                title: const Text('Alert', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.to(NotificationPage(),
                      transition: Transition.rightToLeft);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_page_outlined,
                    size: 30, color: AppColors.whiteBoxColor),
                title:
                    const Text('Contact', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.to(ContactPage(), transition: Transition.rightToLeft);
                },
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined,
                    size: 30, color: AppColors.whiteBoxColor),
                title:
                    const Text('Privacy', style: StringsStyle.whiteTextStyle),
                onTap: () {
                  Get.to(PrivacyPolicyPage(),
                      transition: Transition.rightToLeft);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
