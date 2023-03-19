import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/AppLayout.dart';
import 'package:visit_medina/features/User/Profile/view.dart';
import 'package:visit_medina/features/administrator/Home/view.dart';
import 'package:visit_medina/shared/components/navigator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/forgot.gif",width: 300),
              SizedBox(height: 50,),
              TextFieldTemplate(
                hintText: "البريد الالكتروني",
                controller: controller,
                icon: Icon(Icons.person),
              ),


              SizedBox(height: 20,),
              ButtonTemplate(
                color: AppColors.green,
                text1: "استعادة كلمة المرور",
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
