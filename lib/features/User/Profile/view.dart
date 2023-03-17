import 'package:flutter/material.dart';
import 'package:visit_medina/features/Activities/view.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';

class ProfilUser extends StatelessWidget {
  const ProfilUser({Key? key}) : super(key: key);

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
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.green,
                  )))
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(AppImages.drawer, height: 30),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.green),
              child: Center(
                  child: Text("الملف الشخصي (السائح)",
                      style: AppTextStyles.bold.copyWith(fontSize: 20))),
            ),
            ContainerData(
              text1: 'الاسم الاول',
              text2: 'فاطمة',
            ),
            ContainerData(
              text1: 'الاسم الاخير',
              text2: 'عبدالله',
            ),
            ContainerData(
              text1: 'البريد الالكتروني',
              text2: 'FatimaAbdullah@hotmail.com',
            ),
            ContainerData(
              text1: 'كلمة المرور',
              text2: '***********',
            ),
            Text(
              " صلاحيات",
              style: AppTextStyles.bold.copyWith(
                fontSize: 22,
                color: AppColors.green,
              ),
            ),
            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "الحجز",
                onPressed: () {}),
            SizedBox(
              height: 5,
            ),
            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "اضف انشظة وفعاليات",
                onPressed: () {
                  navigateTo(context, Activities());
                }),
            Expanded(
              child: SizedBox(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTemplate(
                  color: AppColors.green,
                  text1: "تسجيل الخروج",
                  icon: Icons.output_sharp,
                  onPressed: () {}),
            )
          ],
        ),
      )),
    );
  }
}

class ContainerData extends StatelessWidget {
  final String text1;
  final String text2;

  const ContainerData({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text(text1,maxLines: 1,
                  style: AppTextStyles.w600.copyWith(fontSize: 18))),
          Expanded(
            flex: 5,
            child: Container(
              height: 45,
              // width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.greenlight),
              child: Center(
                child: Text(text2,
                    style: AppTextStyles.bold
                        .copyWith(fontSize: 15, color: AppColors.green)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
