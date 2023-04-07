import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visit_medina/features/administrator/Home/view.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';

class ActivitySuccses extends StatefulWidget {
  const ActivitySuccses({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ActivitySuccses> createState() => _ActivitySuccsesState();
}

class _ActivitySuccsesState extends State<ActivitySuccses> {
  @override
  void initState(){
    Timer(const Duration(seconds: 2), () {
      navigateAndFinished(context, HomeAdmin());    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.w800
                      .copyWith(fontSize: 20, color: AppColors.green),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                      child: Image.asset(AppImages.done, height: 300)),
                ),
                Center(
                    child: Text(
                      ' تم ${widget.title}',
                      style: AppTextStyles.w800
                          .copyWith(fontSize: 20, color: AppColors.green),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
