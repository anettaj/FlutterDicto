import 'package:flutter/widgets.dart';

class ScreenSize {
  static double Height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double Width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}