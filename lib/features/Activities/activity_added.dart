import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../shared/styles/images.dart';

class ActivitySuccses extends StatelessWidget {
  const ActivitySuccses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back,color: AppColors.green,)))
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(AppImages.drawer, height: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إضافة مكان سياحي',
              style: AppTextStyles.w800
                  .copyWith(fontSize: 20, color: AppColors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(child: Image.asset(AppImages.done, height: 300)),
            ),
            Center(
                child: Text(
              ' تم إضافة مكان سياحي بنجاح',
              style: AppTextStyles.w800
                  .copyWith(fontSize: 20, color: AppColors.green),
            )),
            Expanded(child: SizedBox()),
            ButtonTemplate(
                color: AppColors.green,
                text1: 'العودة للصفحة الرئيسية',
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
