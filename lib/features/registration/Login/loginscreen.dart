import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/AppLayout.dart';
import 'package:visit_medina/shared/components/navigator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          TextFieldTemplate(
            hintText: "البريد الالكتروني",
            controller: controller,
            icon: Icon(Icons.person),
          ),
          TextFieldTemplate(
            hintText: "كلمة المرور",
            controller: controller,
            icon: Icon(Icons.lock),
          ), SizedBox(height: 20,),
          ButtonTemplate(
            color: AppColors.green,
            text1: "دخول",
            onPressed: () {

              navigateTo(context, AppLayout());
            },
          )
        ],
      ),
    );
  }
}
