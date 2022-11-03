import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taiton/pages/drawer_page.dart';
import 'package:taiton/pages/notification_page.dart';
import 'package:taiton/pages/productdetail_page.dart';
import 'package:taiton/pages/search_page.dart';
import 'package:taiton/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  key: _scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          //  key: _scaffoldKey,
          iconTheme: IconThemeData(color: Colors.indigo),
          backgroundColor: AppColors.appBarBackgroundColor,
          // leading: InkWell(
          //   onTap: _openDrawer,
          //   child:
          //       IconButton(onPressed: () {}, icon: Icon(Icons.notes, size: 30)),
          //   //  Padding(
          //   //   padding: const EdgeInsets.all(18.0),
          //   //   child: Image.asset(
          //   //     "assets/images/drawer_icon.png",
          //   //   ),
          //   // ),
          // ),
          centerTitle: true,
          title: Container(width: 120, height: 50, color: Colors.red),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(NotificationPage(),
                      transition: Transition.rightToLeft);
                },
                icon: Icon(Icons.notifications, size: 30)),
          ],
        ),
        drawer: Drawer(
          child: DrawerPage(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headingView(),
              SizedBox(height: 10),
              _productView(),
            ],
          ),
        ));
  }

  _headingView() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Container(
            height: Get.height / 3.5,
            width: Get.width,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: () {
              Get.to(SearchPage(), transition: Transition.rightToLeft);
            },
            child: SizedBox(
              height: 50,
              width: Get.width / 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Card(
                    elevation: 3,
                    color: AppColors.whiteBoxColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.search),
                        SizedBox(width: 5),
                        Text("Type your wish here....")
                      ],
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  _productView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
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
                    delay: Duration(seconds: 1),
                    child: Card(
                      elevation: 5,
                      color: AppColors.whiteBoxColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Expanded(child: Container(color: Colors.red[100])),
                            Container(
                              color: AppColors.whiteBoxColor,
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      "Automatic Doors & Electronic Locks"),
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
    );
  }
}
