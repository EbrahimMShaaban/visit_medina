import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/Owner/Activities/activity_waiting.dart';
import 'package:visit_medina/features/Owner/Activities/under%20processing.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/end_point.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../../administrator/Activities/activity_added.dart';
import '../../administrator/Activities/postEvent_cubit/cubit.dart';
import '../../administrator/Activities/postEvent_cubit/state.dart';
import '../../registration/getUser_cubit/cubit.dart';

enum Places { coffee, resturant, activities }

class ActivitiesOwner extends StatefulWidget {
  ActivitiesOwner({Key? key, required this.titleAppBar, required this.event})
      : super(key: key);
  final String titleAppBar;
  final String event;

  @override
  State<ActivitiesOwner> createState() => _ActivitiesOwnerState();
}

class _ActivitiesOwnerState extends State<ActivitiesOwner> {
  TextEditingController controllerAddres = TextEditingController();
  TextEditingController controllerLinkAddress = TextEditingController();

  TextEditingController controllerNameEvent = TextEditingController();
  TextEditingController controllerdescription = TextEditingController();
  TextEditingController controllernumber = TextEditingController();
  TextEditingController controllerprice = TextEditingController();
  TextEditingController controllerTime = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();
  Places? _character = Places.resturant;
  String type = "المطاعم";
  var nowDateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEventCubit(),
      child: BlocConsumer<AddEventCubit, AddEventStates>(
        listener: (context, state) {
          print(state);
          if (state is AddEventOrPlaceSuccessState) {
            navigateAndFinished(
                context, ActivityWaiting(title: widget.titleAppBar));
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    widget.titleAppBar,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddEventCubit.get(context).postImage != null
                            ? Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        image: FileImage(
                                            AddEventCubit.get(context)
                                                .postImage!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      AddEventCubit.get(context)
                                          .removePostImage();
                                    },
                                    icon: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.deepPurple,
                                      child: Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : InkWell(
                                onTap: () async {
                                  await AddEventCubit.get(context)
                                      .getPostImage();
                                },
                                child: Container(
                                  height: 150,
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: AppColors.greenlight,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'قم باخيتار صورة للموقع',
                                        style: AppTextStyles.w800.copyWith(
                                            color: AppColors.primarycolor,
                                            fontSize: 25),
                                      ),
                                      Icon(Icons.camera_alt_outlined,
                                          size: 40, color: AppColors.green),
                                    ],
                                  ),
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'اسم الموقع:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    cursorColor: AppColors.blue,
                                    controller: controllerNameEvent,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال اسم الموقع ';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'العنوان:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال العنوان ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllerAddres,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'رابط العنوان:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال العنوان ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllerLinkAddress,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text('الوصف:',
                                    style: AppTextStyles.w800.copyWith(
                                        color: AppColors.primarycolor,
                                        fontSize: 15))),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال الوصف ';
                                      }
                                      return null;
                                    },
                                    maxLines: 3,
                                    cursorColor: AppColors.blue,
                                    controller: controllerdescription,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'رقم الجوال:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال الجوال ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllernumber,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'السعر:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال السعر ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllerprice,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,

                                        // labelStyle: AppTextStyles.hittext,
                                        // hintStyle: AppTextStyles.hittext,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'الوقت:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال الوقت ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllerTime,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'التاريخ:',
                                  style: AppTextStyles.w800.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                )),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'الارجاء ادخال التاريخ ';
                                      }
                                      return null;
                                    },
                                    cursorColor: AppColors.blue,
                                    controller: controllerDate,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: AppColors.greenlight,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
                                        disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Radio<Places>(
                                  activeColor: AppColors.primarycolor,
                                  value: Places.resturant,
                                  groupValue: _character,
                                  onChanged: (Places? value) {
                                    setState(() {
                                      _character = value;
                                      type = 'المطاعم';
                                    });
                                  },
                                ),
                                Text('المطاعم',
                                    style: AppTextStyles.w800.copyWith(
                                        color: AppColors.primarycolor,
                                        fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<Places>(
                                  activeColor: AppColors.primarycolor,
                                  value: Places.coffee,
                                  groupValue: _character,
                                  onChanged: (Places? value) {
                                    setState(() {
                                      _character = value;
                                      type = 'المقاهي';
                                    });
                                  },
                                ),
                                Text('المقاهي',
                                    style: AppTextStyles.w800.copyWith(
                                        color: AppColors.primarycolor,
                                        fontSize: 15)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<Places>(
                                  activeColor: AppColors.primarycolor,
                                  value: Places.activities,
                                  groupValue: _character,
                                  onChanged: (Places? value) {
                                    setState(() {
                                      _character = value;
                                      type = 'الأنشطة';
                                    });
                                  },
                                ),
                                Text('الأنشطة',
                                    style: AppTextStyles.w800.copyWith(
                                        color: AppColors.primarycolor,
                                        fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                        state is AddEventOrPlaceLoadingState
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 60,
                                child: ButtonTemplate(
                                    color: AppColors.green,

                                    //  fontSize: 10,
                                    text1: 'طلب اضافة',
                                    onPressed: () {
                                      NameUser =
                                          CacheHelper.getData(key: 'name');

                                      String event = widget.event.toString();
                                      if (formKey.currentState!.validate()) {
                                        if (AddEventCubit.get(context)
                                                .postImage ==
                                            null) {
                                          MotionToast.error(
                                            description: Text("يجب اضافة صورة"),
                                          ).show(context);
                                        } else {
                                          AddEventCubit.get(context)
                                              .uploadPostImage(
                                                  name: NameUser,
                                                  linkAddress:
                                                      controllerLinkAddress
                                                          .text,
                                                  nameEvent:
                                                      controllerNameEvent.text,
                                                  dateTime:
                                                      nowDateTime.toString(),
                                                  address:
                                                      controllerAddres.text,
                                                  description:
                                                      controllerdescription
                                                          .text,
                                                  accept: false,
                                                  price: controllerprice.text,
                                                  number: controllernumber.text,
                                                  time: controllerTime.text,
                                                  date: controllerDate.text,
                                                  event: widget.event,
                                                  type: type);
                                        }
                                      }
                                    }),
                              )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
