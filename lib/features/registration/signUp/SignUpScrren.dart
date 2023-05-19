import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';
import 'package:visit_medina/features/User/view.dart';
import 'package:visit_medina/features/registration/signUp/register_cubit/cubit.dart';
import 'package:visit_medina/features/registration/signUp/register_cubit/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/viewscreen.dart';

import '../../../shared/network/local/shared_preferences.dart';
import '../../../shared/styles/styles.dart';

enum Places { owner, user }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController password2controller = TextEditingController();
  Places? _character = Places.user;
  String type = "user";

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: formKey,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              TextFieldTemplate(
                hintText: "الاسم ",
                controller: namecontroller,
                icon: Icon(Icons.person),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'الارجاء ادخال الاسم ';
                  }
                  return null;
                },
              ),
              TextFieldTemplate(
                hintText: "البريد الالكتروني",
                controller: emailcontroller,
                icon: Icon(Icons.email),
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
                  isPassword: true,
                  icon: Icon(Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال كلمة المرور ';
                    } else if (value.length < 5) {
                      return 'يجب ان تتكون كلمة المرور علي الاقل من ثمانيه خانات';
                    } else if (!validateStructure(value)) {
                      return 'يجب ان تحتوى كلمة المرور على ثمانيه خانات  \nوأحرف الكبيرة وأحرف الصغيرة ورموز @#%&* ';
                    }
                  }),
              TextFieldTemplate(
                hintText: "تاكيد كلمة المرور",
                controller: password2controller,
                isPassword: true,
                validator: (String? value) {
                  if (passwordcontroller.text != password2controller.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
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
                            type = "user";
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
                            type = "owner";
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
              BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                  if (state is RegisterErrorState) {
                    MotionToast.error(
                      description: Text(state.error),
                    ).show(context);
                  }
                  if (state is RegisterSuccessState) {
                    CacheHelper.saveData(key: 'uId', value: state.uid)
                        .then((value) {
                      type == "owner"
                          ? navigateAndFinished(context, HomeOwner())
                          : navigateAndFinished(context, VisitorView());
                    });
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return state is RegisterLoadingState
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ButtonTemplate(
                          color: AppColors.green,
                          text1: "دخول",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(type);
                              RegisterCubit.get(context).userRegister(
                                  name: namecontroller.text,
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  type: type);
                            }
                          },
                        );
                },
              ),
              ButtonTemplate(
                color: AppColors.green,
                text1: "دخول كزائر",
                onPressed: () {
                  navigateAndFinished(context, ViewScrren());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
