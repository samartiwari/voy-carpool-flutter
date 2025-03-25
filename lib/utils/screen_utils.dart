import 'package:flutter/material.dart';

//Define the size of current device for responsive UI
class ScreenUtils {
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
  static TextScaler textScale(BuildContext context) => MediaQuery.of(context).textScaler;
}