import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/Events/rating.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../reversaation/view.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سكة حديد الحجاز',
          style:
              AppTextStyles.bold.copyWith(color: AppColors.green, fontSize: 24),
        ),
      ),
      body: Container(
        //   padding: EdgeInsets.symmetric(vertical: 20),
        width: MediaQueryHelper.sizeFromWidth(context, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   'سكة حديد الحجاز',
            //   style: AppTextStyles.bold
            //       .copyWith(color: AppColors.green, fontSize: 24),
            // ),
            Image.asset(
              AppImages.sekka,
              width: MediaQueryHelper.sizeFromWidth(context, 1),
            ),
            Text(
                'توجه إلى متحف سمة الحجاز، الذي يقع في المحطة ذات الطراز المعماري الإدواردي، حيث فتح المتحف أبوابه لجميع الزائرين من كل مكان من أجل الاستمتاع بكل ما يحتويه من مقتنيات وآثار تاريخية وإسلامية، بالاضافة الى مساحات واسعة للاستمتاع بالمكان.'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTemplate(
                  color: AppColors.green, text1: 'التفاصيل', onPressed: () {}),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonTemplate(
                    color: AppColors.green,
                    minwidth: 50,
                    text1: 'شاركنا رأيك',
                    onPressed: () {
                      navigateTo(context, RatingView());
                    }),
                ButtonTemplate(
                    color: AppColors.green,
                    minwidth: 50,
                    text1: 'احجز الأن',
                    onPressed: () {
                      navigateTo(context, ReversationView());
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
