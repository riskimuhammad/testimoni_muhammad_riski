import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:muhammad_riski_testimoni/core/material/material_color.dart';
import 'package:muhammad_riski_testimoni/core/material/material_text_style.dart';

class DialogHelper {
  static snackBarHelper(context, {message}) {
    Flushbar(
      messageText: Text(
        message,
        style: materialTextStyle.textStyleFZ11,
      ),
      icon: Icon(
        Icons.info,
        size: 28.0,
        color: TestimonialColor.blue,
      ),
      padding: EdgeInsets.only(top: 16, bottom: 16),
      duration: Duration(seconds: 2),
      backgroundColor: TestimonialColor.blue.shade50,
      margin: EdgeInsets.only(left: 16, right: 16, top: 40),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(10),
    )..show(context);
  }
}
