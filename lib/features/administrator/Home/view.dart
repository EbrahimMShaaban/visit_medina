import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/view.dart';
import 'package:visit_medina/features/administrator/addAdmins/Add_Admin.dart';
import 'package:visit_medina/features/administrator/reportScreen/view.dart';
import 'package:visit_medina/features/registration/Login/loginscreen.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/components/end_point.dart';
import '../../../shared/styles/images.dart';
import '../../registration/regist_screen/view.dart';
import '../Activities/adminactivity.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(TYPE +"ssssssssss");
    return Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي (المسؤول)",
            style: AppTextStyles.bold
                .copyWith(fontSize: 25, color: AppColors.green)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerData(
                text1: 'الاسم ',
                text2: 'admin',
              ),
              ContainerData(
                text1: 'البريد الالكتروني',
                text2: 'admin@hotmail.com',
              ),
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
                        Activities(
                          titleAppBar: "اضف مكان سياحي",
                        ));
                  }),
              SizedBox(
                height: 5,
              ),
              ButtonTemplate(
                  color: AppColors.greenlight,
                  colortext: AppColors.green,
                  text1: "اضف انشطة وفعاليات",
                  onPressed: () {
                    navigateTo(
                        context,
                        Activities(
                          titleAppBar: "إضافة أنشطة وفعاليات",
                        ));
                  }),
              SizedBox(
                height: 5,
              ),
              ButtonTemplate(
                  color: AppColors.greenlight,
                  colortext: AppColors.green,
                  text1: "قبول أو رفض حدث",
                  onPressed: () {
                    navigateTo(context, Accept_Or_Reject());
                  }),
              ButtonTemplate(
                  color: AppColors.greenlight,
                  colortext: AppColors.green,
                  text1: "تقرير احصائي عن الحجوزات",
                  onPressed: () {

                    navigateTo(context, ReportScreen());
                  }),
              TYPE=="admin"?  ButtonTemplate(
                  color: AppColors.greenlight,
                  colortext: AppColors.green,
                  text1: "اضافة مشرف",
                  onPressed: () {

                    navigateTo(context, AddAdminScreen());
                  }):SizedBox(),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTemplate(
                    color: AppColors.green,
                    text1: "تسجيل الخروج",
                    icon: Icons.output_sharp,
                    onPressed: () {
                      showMyDialog(
                          context: context,
                          ontap: () {

                            signout(context);
                          },
                          message: "تسجيل الخروج");
                    }),
              )
            ],
          ),
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
      padding: const EdgeInsets.only(bottom: 15.0, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 6,
              child: Text(text1,
                  maxLines: 1,
                  style: AppTextStyles.w600.copyWith(fontSize: 18))),
          Expanded(
            flex: 8,
            child: Container(
              height: 45,
              // width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.greenlight),
              child: Center(
                child: Text(text2,
                    style: AppTextStyles.bold
                        .copyWith(fontSize: 13, color: AppColors.green)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
