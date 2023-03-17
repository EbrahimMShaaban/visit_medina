import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  /// - weight: w200
  /// - family: cairo




  /// - weight: w300
  /// - family: cairo


  /// - weight: w400
  /// - family: cairo


  /// - weight: w500
  /// - family: cairo


  /// - weight: w600
  /// - family: cairo
  static TextStyle w600 = TextStyle(fontWeight: FontWeight.w600,color: AppColors.green);
  static TextStyle bold = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColors.white);

  /// - weight: w700
  /// - family: cairo


  /// - weight: w800
  /// - family: cairo
  static TextStyle w800 = TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo

}
