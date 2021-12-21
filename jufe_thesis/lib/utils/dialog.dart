// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsDialog {
  ShowShortToast(String msg, bool isError) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      fontSize: 16.0,
      backgroundColor: isError ? Colors.red : Colors.blue,
    );
  }
}
