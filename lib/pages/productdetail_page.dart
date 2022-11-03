import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings.dart';
import 'package:taiton/utils/strings_style.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var onSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackgroundColor,
        iconTheme: IconThemeData(color: AppColors.darkTextColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _productImageView(),
            _productDetailView(),
            _relatedProductView(),
          ],
        ),
      ),
    );
  }

  _productImageView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: Get.height / 3.5,
        child: Card(
          elevation: 5,
          color: AppColors.whiteBoxColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("NO IMAGE AVAILABLE"),
          )),
        ),
      ),
    );
  }

  _productDetailView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Text(
              Strings.PROD_NAME,
              style: StringsStyle.darkTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "lorem ipsum dolor sit amet, consectoas kas aks a alskkand kasndalk alskdnalnsk askdnalks aksdnals kn",
              style: StringsStyle.lightTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(Strings.PRICE, style: StringsStyle.darkTextStyle),
                    SizedBox(width: 10),
                    Text("Rs. 900", style: StringsStyle.lightTextStyle),
                  ],
                ),
                Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: Offset(0, 3),
                                spreadRadius: 1,
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Icon(Icons.share_outlined,
                              color: AppColors.whiteBoxColor, size: 20),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              children: [
                Text(Strings.MODEL_NO, style: StringsStyle.darkTextStyle),
                SizedBox(width: 10),
                Text("zsd12548", style: StringsStyle.lightTextStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              children: [
                Text(Strings.AVAILABLE_SIZES,
                    style: StringsStyle.darkTextStyle),
                SizedBox(width: 5),
                Container(
                  height: 35,
                  width: Get.width / 1.8,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              onSelect = index;
                            });
                          },
                          child: SizedBox(
                            height: 35,
                            width: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Card(
                                  elevation: 3,
                                  color: onSelect == index
                                      ? AppColors.backgroundColor
                                      : AppColors.whiteBoxColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("1m",
                                          style: onSelect == index
                                              ? StringsStyle.whiteTextStyle
                                              : StringsStyle.lightTextStyle),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: Row(
          //     children: [
          //       Text(Strings.AVAILABLE_SIZES,
          //           style: StringsStyle.darkTextStyle),
          //       SizedBox(width: 5),
          //       Container(
          //         height: 35,
          //         width: Get.width / 1.5,
          //         child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             itemCount: 4,
          //             itemBuilder: (BuildContext context, int index) {
          //               return InkWell(
          //                 onTap: () {
          //                   setState(() {
          //                     onSelect = index;
          //                   });
          //                 },
          //                 child: SizedBox(
          //                   height: 35,
          //                   width: 45,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(0.0),
          //                     child: Container(
          //                         height: 20,
          //                         width: 20,
          //                         decoration: BoxDecoration(
          //                           color: onSelect == index
          //                               ? AppColors.backgroundColor
          //                               : AppColors.whiteBoxColor,
          //                         ),
          //                         child: Center(
          //                           child: Padding(
          //                             padding: const EdgeInsets.all(2.0),
          //                             child: Text("1m",
          //                                 style: onSelect == index
          //                                     ? StringsStyle.whiteTextStyle
          //                                     : StringsStyle.lightTextStyle),
          //                           ),
          //                         )),
          //                   ),
          //                 ),
          //               );
          //             }),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  _relatedProductView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Related Products",
              style: StringsStyle.darkTextStyle,
            ),
          ),
          SizedBox(height: 2),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: Get.height / 3.5,
                width: Get.width / 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(ProductDetailPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: DelayedDisplay(
                              //    delay: Duration(seconds: 1),
                              child: SizedBox(
                                height: Get.height / 3.5,
                                width: Get.width / 3.3,
                                child: Card(
                                  elevation: 3,
                                  color: AppColors.whiteBoxColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                color: Colors.red[100])),
                                        Container(
                                          color: AppColors.whiteBoxColor,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                              child: Text("Product Name",
                                                  style: StringsStyle
                                                      .darkTextStyle),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    }),
              )),
        ],
      ),
    );
  }
}
