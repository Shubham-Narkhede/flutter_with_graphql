import 'dart:io';

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesatogo_task/common/color_helper.dart';

class MaterialButtonClassPage extends StatelessWidget {
  double minwidth;
  Function onPress;
  var buttonName;
  Color color;
  BorderRadiusGeometry radius;
  double height;
  double fontSize;
  double left;
  double right;

  MaterialButtonClassPage(
      {@required this.buttonName,
      @required this.minwidth,
      @required this.onPress,
      this.color,
      this.radius,
      this.height,
      @required this.fontSize,
      @required this.left,
      @required this.right});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (Platform.isAndroid) {
      return Container(
        child: MaterialButton(
          height: height,
          minWidth: minwidth,
          onPressed: () {
            onPress();
          },
          color: color,
          splashColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: radius),
          child: Text(
            buttonName,
            style:
                GoogleFonts.poppins(color: Colors.white, fontSize: fontSize),
          ),
        ),
        margin: EdgeInsets.only(left: left, right: right),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: left, right: right),
        child: CupertinoButton(
          onPressed: () {
            onPress();
          },
          color: color,
          borderRadius: radius,
          child: new Text(
            buttonName,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(color: Colors.white, fontSize: fontSize),
          ),
        ),
        width: minwidth,
      );
    }
  }
}
