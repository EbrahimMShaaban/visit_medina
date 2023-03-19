import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    platform: TargetPlatform.iOS,
    fontFamily: 'Schyler',
    primaryColor: AppColors.green,
    primarySwatch: Colors.green,
    iconTheme: IconThemeData(color: AppColors.primarycolor),
    buttonTheme: ButtonThemeData(
      splashColor: AppColors.primarycolor,
      focusColor: AppColors.primarycolor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.green,
      ),
      headline2: TextStyle(
        color: AppColors.green,
      ),
      bodyText2: TextStyle(
        color: AppColors.green,
      ),
      subtitle1: TextStyle(
        color: AppColors.green,
      ),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primarycolor, size: 25),
        titleTextStyle: TextStyle(
            fontSize: 25, color: AppColors.primarycolor, fontWeight:FontWeight.bold),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primarycolor,
            statusBarIconBrightness: Brightness.light)),
    sliderTheme: const SliderThemeData(
        valueIndicatorColor: AppColors.primarycolor,
        inactiveTickMarkColor: AppColors.slidergrey,
        activeTrackColor: AppColors.primarycolor,
        activeTickMarkColor: AppColors.primarycolor,
        disabledInactiveTrackColor: Colors.blue,
        thumbColor: AppColors.primarycolor,
        rangeTrackShape: RectangularRangeSliderTrackShape(),
        rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: 1.2),
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: 10,
          enabledThumbRadius: 10,
        )));
