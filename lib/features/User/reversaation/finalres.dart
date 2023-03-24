import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/reversaation/payment.dart';
import 'package:visit_medina/features/User/reversaation/payment_card.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class FinalReserv extends StatelessWidget {
  const FinalReserv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إكمال الحجز'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Image.asset(
              AppImages.sekka,
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              height: MediaQueryHelper.sizeFromHeight(context, 3),
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.greenlight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('سكة حديد الحجاز')
                    ],
                  ),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.access_time), Text('6:00 pm')],
                  ),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Text('22/07')
                    ],
                  ),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.person), Text('عدد الزائرين 2')],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.greenlight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('السعر'),
                      Text('34.78 ريال سعودي'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الضريبة'),
                      Text('5.22 ريال سعودي'),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الإجمالي'),
                      Text('40 ريال سعودي'),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text('السياسات', style: AppTextStyles.w800),
              ],
            ),
            Text(
                'يتم إلغاء الحجز في حال التأخير عن الموعد المحدد أكثر من 15 دقيقة  \n  المبلغ المفدوع غير مسترد ولا يشمل قيمة الضربة الإضافية'),
            ButtonTemplate(
                color: AppColors.green,
                text1: 'إتمام الحجز',
                onPressed: () {
                  navigateTo(context, PaymentContainer());
                })
          ],
        ),
      ),
    );
  }
}
