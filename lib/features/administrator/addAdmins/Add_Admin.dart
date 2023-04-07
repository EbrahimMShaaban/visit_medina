import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../registration/signUp/register_cubit/cubit.dart';
import '../../registration/signUp/register_cubit/state.dart';


class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({Key? key}) : super(key: key);

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController password2controller = TextEditingController();
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text("اضافة مشرف جديد"),
          ),
          body: Form(
            key: formKey,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
SizedBox(height: 40,),

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
                  controller: passwordcontroller,isPassword: true,
                  icon: Icon(Icons.lock),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'الرجاء ادخال كلمة المرور';
                    }
                    return null;
                  },
                ),


                SizedBox(
                  height: 20,
                ),
                BlocConsumer<RegisterCubit, RegisterStates>(
                  listener: (context, state) {
                    print(state);
                    if (state is RegisterSuccessState) {

              MotionToast.success(
                description:  Text("تم أضافة مشرف جديد"),
              ).show(context);

                    }
                    if (state is RegisterErrorState) {

              MotionToast.error(
                description:  Text(state.error),
              ).show(context);

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
                      text1: "أضافة مشرف جد يد",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {

                          RegisterCubit.get(context).userRegister(
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                              type: "admin2");
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
