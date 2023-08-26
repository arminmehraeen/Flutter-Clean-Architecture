import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {

  static ThemeData get light => ThemeData(
        primarySwatch: AppColor.appColor,
        fontFamily: 'Yekan',
        brightness: Brightness.light,
      );

  static ThemeData get dark => ThemeData(
        primarySwatch: AppColor.appColor,
        fontFamily: 'Yekan',
        brightness: Brightness.dark,
      );
}
