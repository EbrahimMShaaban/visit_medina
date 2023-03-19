import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/components/components.dart';
import 'activity_added.dart';

enum Places { coffee, resturant, activities }

class Activities extends StatefulWidget {
  Activities({Key? key, required this.titleAppBar}) : super(key: key);
  final String titleAppBar;

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
          title: Text(widget.titleAppBar,
             ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.greenlight,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'قم باخيتار صورة للموقع',
                          style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor,fontSize: 25
                          ),
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
                    Expanded(flex: 1, child: Text('اسم الموقع',
                      style: AppTextStyles.w800.copyWith(
                          color: AppColors.primarycolor,fontSize: 15
                      ),)),
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
                    Expanded(flex: 1, child: Text('شرح الموقع :',style: AppTextStyles.w800.copyWith(
                        color: AppColors.primarycolor,fontSize: 15
                    ))),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio<Places>(activeColor:AppColors.primarycolor,
                          value: Places.resturant,
                          groupValue: _character,
                          onChanged: (Places? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                         Text('المطاعم',style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor,fontSize: 15
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Places>(activeColor:AppColors.primarycolor,
                          value: Places.coffee,
                          groupValue: _character,
                          onChanged: (Places? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                         Text('المقاهي',style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor,fontSize: 15
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Places>(activeColor:AppColors.primarycolor,
                          value: Places.activities,
                          groupValue: _character,
                          onChanged: (Places? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                         Text('الأنشطة',style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor,fontSize: 15
                        )),
                      ],
                    ),
                  ],
                ),
                Container(
                    height: 150,
                    //  margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //     color: AppColors.greenlight,
                    //     borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(AppImages.location)),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 60,
                  child: Expanded(
                    child: ButtonTemplate(
                        color: AppColors.green,

                        //  fontSize: 10,
                        text1: 'حفظ',
                        onPressed: () {
                          navigateTo(context, ActivitySuccses(title: widget.titleAppBar,));
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
