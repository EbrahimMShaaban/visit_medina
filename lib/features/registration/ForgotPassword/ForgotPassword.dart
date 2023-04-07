import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/registration/regist_screen/view.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import 'cubit/reset_password_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/forgot.gif", width: 300),
                    SizedBox(
                      height: 50,
                    ),
                    TextFieldTemplate(
                      hintText: "البريد الالكتروني",
                      controller: email,
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
                    SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                      listener: (context, state) {
                        // TODO: implement listener
                        if (state is ResetPasswordErrorState) {
                          MotionToast.error(
                            description: Text(state.error),
                          ).show(context);
                        }
                        if (state is ResetPasswordSuccessState) {
                          MotionToast.success(
                            description:
                                Text("تم الارسال بنجاح الي البريد الإلكتروني"),
                          ).show(context);
                        }
                      },
                      builder: (context, state) {

                        return state is ResetPasswordLoadingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ButtonTemplate(
                                color: AppColors.green,
                                text1: "استعادة كلمة المرور",
                                onPressed: () {
    if (formKey.currentState!.validate()) {
                                  ResetPasswordCubit.get(context)
                                      .resetPassword(email: email.text);}
                                },
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
