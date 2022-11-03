import 'package:flutter/material.dart';
import 'package:taiton/utils/colors.dart';
import 'package:taiton/utils/strings_style.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  const CustomButton({
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: widget.height,
      width: widget.width,
      child: Center(
        child: Text(widget.text, style: StringsStyle.whiteTextStyle),
      ),
    );
  }
}
