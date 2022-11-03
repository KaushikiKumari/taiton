import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings_style.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.indigo),
          backgroundColor: AppColors.appBarBackgroundColor,
          centerTitle: true,
          title: Container(width: 120, height: 50, color: Colors.red),
        ),
        body: SingleChildScrollView(
            child: DelayedDisplay(
          // delay: Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "In layman's terms, Lorem Ipsum is a dummy or placeholder text. It's often used in laying out print, infographics, or web design. The primary purpose of Lorem Ipsum is to create text that does not distract from the overall layout and visual hierarchy.In layman's terms, Lorem Ipsum is a dummy or placeholder text. It's often used in laying out print, infographics, or web design. The primary purpose of Lorem Ipsum is to create text that does not distract from the overall layout and visual hierarchy.In layman's terms, Lorem Ipsum is a dummy or placeholder text. It's often used in laying out print, infographics, or web design. The primary purpose of Lorem Ipsum is to create text that does not distract from the overall layout and visual hierarchy.",
                style: StringsStyle.whiteTextStyle),
          ),
        )));
  }
}
