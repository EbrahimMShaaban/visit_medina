import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/view.dart';
import 'package:visit_medina/features/registration/Login/loginscreen.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../models/user_model.dart';
import '../../../shared/styles/images.dart';
import '../../registration/getUser_cubit/cubit.dart';
import '../../registration/getUser_cubit/state.dart';
import '../../registration/regist_screen/view.dart';

class ProfilOwner extends StatefulWidget {
  ProfilOwner({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;

  @override
  State<ProfilOwner> createState() => _ProfilOwnerState();
}

class _ProfilOwnerState extends State<ProfilOwner> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controlleremail = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String? _controllerName = widget.userModel!.name;
    print("$_controllerName ""ddddddd");

    controllerName = TextEditingController(text: _controllerName);
    String? _controlleremail = widget.userModel!.email;
    controlleremail = TextEditingController(text: _controlleremail);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetUserCubit()
        ..getUserData(),

      child:  BlocConsumer<GetUserCubit, GetUserStates>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is UpdateProfileSuccessState){
            navigateTo(context, HomeOwner());
            MotionToast.success(
              description: Text("تم تعد يل الملف الشخصى بنجاح"),
            ).show(context);
          }

          if (state is DeleteProfileSuccessState){

            signout(context);
          }
        },
        builder: (context, state) {


          return Scaffold(
            appBar: AppBar(
              title: Text("الملف الشخصي (المالك)",
                  style: AppTextStyles.bold
                      .copyWith(fontSize: 25, color: AppColors.green)),

            ),
            body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 20),
                    child: Container(
                      height: MediaQueryHelper.sizeFromHeight(context, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          if (state is UpdateProfileLoadingState )
                            LinearProgressIndicator(),
                          ContainerData(
                            text1: 'الاسم ',
                            text2: 'خالد محمد',
                            controller: controllerName,
                            hintText: 'الاسم',
                          ),
                          ContainerData(
                            controller: controlleremail,
                            hintText: 'البريد الالكتروني',
                            text1: 'البريد الالكتروني',
                            text2: 'KhalidOmar@hotmail.com',
                          ),

                          Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ButtonTemplate(
                                color: AppColors.green,
                                text1: "تعد يل الملف الشخصى",
                                icon: Icons.person,
                                onPressed: () {
                                  GetUserCubit.get(context).updateProfileDate(
                                      context: context,
                                      name: controllerName.text,
                                      email: controlleremail.text);

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
          GetUserCubit.get(context).deleteProfileDate();


                                      },
                                      message: "حذف الملف الشخصى");
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
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
    required this.text2,
    required this.controller,
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
          SizedBox(
            height: 10,
          ),
          TextFieldTemplate(hintText: hintText, controller: controller)
        ],
      ),
    );
  }
}
