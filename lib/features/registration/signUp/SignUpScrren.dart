import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFieldTemplate(
                  hintText: "الاسم الأول",
                  controller: controller,
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFieldTemplate(
                  hintText: "الاسم الثانى",
                  controller: controller,
                  icon: Icon(Icons.person),
                ),
              ),
            ],
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
          SizedBox(height: 20,),
          ButtonTemplate(
            color: AppColors.green,
            text1: "دخول",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
