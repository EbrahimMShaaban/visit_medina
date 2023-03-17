import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../shared/components/components.dart';
import 'activity_added.dart';

enum Places { coffee, resturant, activities }

class Activities extends StatefulWidget {
  Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  TextEditingController controller = TextEditingController();
  Places? _character = Places.resturant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color: AppColors.green,)))
          ],
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(AppImages.drawer, height: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 80,
                  color: AppColors.green,
                  child: Center(
                      child: Text(
                        'الملف الشخصي (المالك)',
                        style: AppTextStyles.w600.copyWith(color: Colors.white),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("إضافة أنشطة وفعاليات"),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: AppColors.greenlight,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('قم باخيتار صورة للموقع'),
                      Icon(Icons.camera_alt_outlined,
                          size: 40, color: AppColors.green),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: Text('اسم الموقع')),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: TextFormField(
                            cursorColor: AppColors.blue,
                            controller: controller,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: AppColors.greenlight,

                                // labelStyle: AppTextStyles.hittext,
                                // hintStyle: AppTextStyles.hittext,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
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
                    Expanded(flex: 1, child: Text('شرح الموقع :')),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: TextFormField(
                            maxLines: 3,
                            cursorColor: AppColors.blue,
                            controller: controller,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: AppColors.greenlight,

                                // labelStyle: AppTextStyles.hittext,
                                // hintStyle: AppTextStyles.hittext,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40))))),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Radio<Places>(
                        value: Places.resturant,
                        groupValue: _character,
                        onChanged: (Places? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      const Text('المطاعم'),

                    ],),
                    Row(children: [
                      Radio<Places>(
                        value: Places.coffee,
                        groupValue: _character,
                        onChanged: (Places? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      const Text('المقاهي'),

                    ],),Row(children: [
                      Radio<Places>(
                        value: Places.activities,
                        groupValue: _character,
                        onChanged: (Places? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      const Text('الأنشطة'),

                    ],),

                  ],
                ),




                Container(
                    height: 150,
                    //  margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    // decoration: BoxDecoration(
                    //     color: AppColors.greenlight,
                    //     borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(AppImages.location)),
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonTemplate(
                              color: AppColors.green,
                              //   fontSize: 10,
                              text1: 'رجوع',
                              onPressed: () {})),
                      SizedBox(width: 30),
                      Expanded(
                        child: ButtonTemplate(
                            color: AppColors.green,

                            //  fontSize: 10,
                            text1: 'إرسال طلب',
                            onPressed: () {
                              navigateTo(context, ActivitySuccses());
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
