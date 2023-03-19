import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:visit_medina/features/Owner/Activities/CommentsScreen.dart';
import 'package:visit_medina/features/Owner/profil/view.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/view.dart';
import 'package:visit_medina/features/registration/Login/loginscreen.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';
import '../../registration/regist_screen/view.dart';
import '../Activities/owneractivity.dart';
import '../Activities/under processing.dart';
import 'bookings.dart';

class HomeOwner extends StatelessWidget {
  const HomeOwner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الصفحة الرئيسية(المالك)",
            style: AppTextStyles.bold
                .copyWith(fontSize: 25, color: AppColors.green)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              ". صلاحيات",
              style: AppTextStyles.w600
                  .copyWith(color: AppColors.green, fontSize: 30),
            ),
            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "اضف مكان سياحي",
                onPressed: () {
                  navigateTo(
                      context,
                      ActivitiesOwner(
                        titleAppBar: "اضف مكان سياحي",
                      ));
                }),
            SizedBox(
              height: 5,
            ),
            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "اضف انشظة وفعاليات",
                onPressed: () {
                  navigateTo(
                      context,
                      ActivitiesOwner(
                        titleAppBar: "إضافة أنشطة وفعاليات",
                      ));
                }),
            SizedBox(
              height: 5,
            ),  ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "قيد المعالجة",
                onPressed: () {
                  navigateTo(
                      context,
                      UnderProcessing(

                      ));
                }),
            SizedBox(
              height: 5,
            ),


            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "عرض التعليقات",
                onPressed: () {
                  navigateTo(context, CommentsScreen());
                }), SizedBox(
              height: 5,
            ),


            ButtonTemplate(
                color: AppColors.greenlight,
                colortext: AppColors.green,
                text1: "عرض الحجوزات",
                onPressed: () {
                  navigateTo(context, BookingScreen());
                }),
            Expanded(
              child: SizedBox(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTemplate(
                  color: AppColors.green,
                  text1: "الملف الشخصى",
                  icon: Icons.person,
                  onPressed: () {

                          navigateTo(context, ProfilOwner());

                  }),
            ),   SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTemplate(
                  color: AppColors.green,
                  text1: "تسجيل الخروج",
                  icon: Icons.output_sharp,
                  onPressed: () {
                    showMyDialog(message:  "تسجيل الخروج",
                        context: context,
                        ontap: () {
                          navigateAndFinished(context, RegistScreen());
                        });
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

