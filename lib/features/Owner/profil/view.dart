import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/view.dart';
import 'package:visit_medina/features/registration/Login/loginscreen.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';
import '../../registration/regist_screen/view.dart';

class ProfilOwner extends StatelessWidget {
   ProfilOwner({Key? key}) : super(key: key);
  @override
  TextEditingController controller =TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي (المالك)",
            style: AppTextStyles.bold
                .copyWith(fontSize: 25, color: AppColors.green)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Container(
            height: MediaQueryHelper.sizeFromHeight(context, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                ContainerData(
                  text1: 'الاسم ',
                  text2: 'خالد محمد', controller: controller, hintText: 'الاسم',
                ),
                ContainerData( controller: controller, hintText: 'البريد الالكتروني',
                  text1: 'البريد الالكتروني',
                  text2: 'KhalidOmar@hotmail.com',
                ),

                // Expanded(
                //   child: SizedBox(),
                // ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTemplate(
                      color: AppColors.green,
                      text1: "تعديل الملف الشخصى",
                      icon: Icons.person,
                      onPressed: () {

                      }),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTemplate(
                      color: Colors.red,
                      text1: "حذف الملف الشخصى",
                      icon: Icons.output_sharp,
                      onPressed: () {
                        showMyDialog(
                            context: context,
                            ontap: () {
                              navigateAndFinished(context, RegistScreen());
                            }, message: "حذف الملف الشخصى");
                      }),
                ),
              ],
            ),
        ),
      ),
          )),
    );
  }
}

class ContainerData extends StatelessWidget {
  final String text1;
  final String text2;
  final String hintText;
  final TextEditingController controller;

  const ContainerData({
    super.key,
    required this.text1,
    required this.hintText,
    required this.text2, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1, style: AppTextStyles.w600.copyWith(fontSize: 15)),
          SizedBox(height: 10,),
TextFieldTemplate(hintText:hintText , controller: controller)        ],
      ),
    );
  }
}
