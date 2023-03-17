import 'package:flutter/material.dart';
import 'package:visit_medina/features/registration/regist_screen/view.dart';
import 'package:visit_medina/features/registration/signUp/SignUpScrren.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'Login/loginscreen.dart';

class startRegistrationScreen extends StatelessWidget {
  const startRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(AppImages.Welcam, fit: BoxFit.cover),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        navigateTo(context, RegistScreen());

                      },
                      child: Text(
                        "دخول",
                        style: AppTextStyles.bold
                      )),
                  VerticalDivider(
                    color: Colors.white,  //color of divider
                    width: 10, //width space of divider
                    thickness: 3, //thickness of divier line
                    indent: 10, //Spacing at the top of divider.
                    endIndent: 10, //Spacing at the bottom of divider.
                  ),

                  TextButton(
                      onPressed: () {

                        navigateTo(context, RegistScreen());
                      },
                      child: Text(
                        "تسجيل",
                        style: AppTextStyles.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
