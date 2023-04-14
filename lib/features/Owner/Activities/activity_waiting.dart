import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visit_medina/features/administrator/Home/view.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';
import '../Home/view.dart';

class ActivityWaiting extends StatefulWidget {
  const ActivityWaiting({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ActivityWaiting> createState() => _ActivityWaitingState();
}

class _ActivityWaitingState extends State<ActivityWaiting> {
  @override
  void initState(){
    Timer(const Duration(seconds: 5), () {
      navigateAndFinished(context, HomeOwner());    });
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                      child: Image.asset("assets/images/129118-done.gif", )),
                ),
                Center(
                    child: Text(
                      'تم ارسال طلبك بنجاح ',
                      style: AppTextStyles.w800
                          .copyWith(fontSize: 20, color: AppColors.green),
                    )),  SizedBox(height: 10,),Center(
                    child: Text(
                      'طلبك قيد المعالجة',
                      style: AppTextStyles.w800
                          .copyWith(fontSize: 17, color: AppColors.green),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
