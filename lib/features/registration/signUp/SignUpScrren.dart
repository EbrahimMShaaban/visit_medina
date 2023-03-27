import 'package:flutter/material.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';
import 'package:visit_medina/features/User/view.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';

import '../../../shared/styles/styles.dart';

enum Places { owner, user }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controller = TextEditingController();
  Places? _character = Places.user;
  int type = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          TextFieldTemplate(
            hintText: "الاسم ",
            controller: controller,
            icon: Icon(Icons.person),
          ),
          TextFieldTemplate(
            hintText: "البريد الالكتروني",
            controller: controller,
            icon: Icon(Icons.email),
          ),
          TextFieldTemplate(
            hintText: "كلمة المرور",
            controller: controller,
            icon: Icon(Icons.lock),
          ),
          TextFieldTemplate(
            hintText: "تاكيد كلمة المرور",
            controller: controller,
            icon: Icon(Icons.lock),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio<Places>(
                    activeColor: AppColors.primarycolor,
                    value: Places.user,
                    groupValue: _character,
                    onChanged: (Places? value) {
                      setState(() {
                        _character = value;
                        type = 1;
                      });
                    },
                  ),
                  Text('سائح',
                      style: AppTextStyles.w800.copyWith(
                          color: AppColors.primarycolor, fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Radio<Places>(
                    activeColor: AppColors.primarycolor,
                    value: Places.owner,
                    groupValue: _character,
                    onChanged: (Places? value) {
                      setState(() {
                        _character = value;
                        type = 2;
                      });
                    },
                  ),
                  Text('مالك',
                      style: AppTextStyles.w800.copyWith(
                          color: AppColors.primarycolor, fontSize: 18)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTemplate(
            color: AppColors.green,
            text1: "دخول",
            onPressed: () {
              print(type);
              type == 1
                  ? navigateAndFinished(context, VisitorView())
                  : navigateAndFinished(context, HomeOwner());
            },
          ),
        ],
      ),
    );
  }
}
