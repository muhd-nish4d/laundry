import 'package:flutter/material.dart';

Widget snackBarAlert(String message) {
  final snackdemo = SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(5),
  );
  return snackdemo;
}
