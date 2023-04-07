import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:visit_medina/features/administrator/Home/view.dart';
import 'package:visit_medina/features/registration/ForgotPassword/ForgotPassword.dart';
import 'package:visit_medina/features/registration/Login/login_cubit/cubit.dart';
import 'package:visit_medina/features/registration/Login/login_cubit/state.dart';
import 'package:visit_medina/shared/components/navigator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/end_point.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../../../shared/styles/colors.dart';
import '../../Owner/Home/view.dart';
import '../../User/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            TextFieldTemplate(
              hintText: "البريد الالكتروني",
              controller: emailcontroller,
              icon: Icon(Icons.person),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'برجاء كتابه البريد الإلكتروني ';
                } else if (value.length < 5) {
                  return 'برجاء كتابه البريد الإلكتروني بشكل صحيح';
                } else if (!value.toString().contains('@')) {
                  return ' @ يجب ان يحتوي البريد الإلكتروني علي  ';
                }
              },
            ),
            TextFieldTemplate(
              hintText: "كلمة المرور",
              controller: passwordcontroller,
              icon: Icon(Icons.lock),
              isPassword: true,

            ),
            InkWell(
              onTap: () {
                navigateTo(context, ForgotPasswordScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("هل نسيت كلمة المرور ؟")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {
                print(state);
                if (state is LoginErrorState) {
                  MotionToast.error(
                    description:  Text(state.error),
                  ).show(context);
                }
                if (state is LoginSuccessState) {
                  CacheHelper.saveData(
                          key: 'uId', value: state.userModel!.uId )
                      .then((value) {
                    CacheHelper.saveData(
                        key: 'type', value: state.userModel!.type.toString() );
                    CacheHelper.saveData(
                        key: 'name', value: state.userModel!.name.toString() );
                    UID = CacheHelper.getData(key: 'uId');
                    TYPE = CacheHelper.getData(key: 'type');
                    print(state.userModel!.type.toString() +
                        "ddddddddddddddddddddddddddddddd");
                    if (state.userModel!.type.toString() == "user")
                      navigateAndFinished(context, VisitorView());
                    if (state.userModel!.type.toString() == "owner")
                      navigateAndFinished(context, HomeOwner());
                    if (state.userModel!.type.toString() == "admin")
                      navigateAndFinished(context, HomeAdmin());
                    if (state.userModel!.type.toString() == "admin2")
                      navigateAndFinished(context, HomeAdmin());
                  });
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return state is LoginLoadingState
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ButtonTemplate(
                        color: AppColors.green,
                        text1: "دخول",
                        onPressed: () {
                          LoginCubit.get(context).userLogin(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
