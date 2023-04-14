import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/Events/rating.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../models/addeventmodel.dart';
import '../../../shared/components/end_point.dart';
import '../../registration/regist_screen/view.dart';
import '../reversaation/view.dart';
import 'map.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key, required this.model}) : super(key: key);
  final EventModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${model.nameEvent}",
          style:
              AppTextStyles.bold.copyWith(color: AppColors.green, fontSize: 24),
        ),
        actions: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.green,
                  )))
        ],
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          //  child: Image.asset(AppImages.drawer, height: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              padding: EdgeInsets.only(bottom: 5),
              child: Hero(

                tag: Hero,
                child: Image.network(
                  "${model.postImage}",
                  fit: BoxFit.cover,
                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                ),
              ),
            ),
            Text(
              "${model.description}",
            ),
            Divider(height: 20, color: Colors.black),
            RichText(
              text: TextSpan(
                text: "السعر :  ",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.primarycolor, fontSize: 25),
                // style: AppTextStyles.w300.apply(
                //   color: Colors.black,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${model.price}",
                    style: AppTextStyles.w800
                        .copyWith(color: AppColors.primarycolor, fontSize: 19),
                    //  style: AppTextStyles.lrTitles
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "النوع :  ",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.primarycolor, fontSize: 25),
                // style: AppTextStyles.w300.apply(
                //   color: Colors.black,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text:  "${model.event}",
                    style: AppTextStyles.w800
                        .copyWith(color: AppColors.primarycolor, fontSize: 25),
                    //  style: AppTextStyles.lrTitles
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "الوقت :  ",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.primarycolor, fontSize: 25),
                // style: AppTextStyles.w300.apply(
                //   color: Colors.black,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${model.time}",
                    style: AppTextStyles.w800
                        .copyWith(color: AppColors.primarycolor, fontSize: 19),
                    //  style: AppTextStyles.lrTitles
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: "التاريخ : ",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.primarycolor, fontSize: 25),
                // style: AppTextStyles.w300.apply(
                //   color: Colors.black,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text:  "${model.date}",
                    style: AppTextStyles.w800
                        .copyWith(color: AppColors.primarycolor, fontSize: 19),
                    //  style: AppTextStyles.lrTitles
                  ),
                ],
              ),
            ),
            const Divider(height: 20, color: Colors.black),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined, color: AppColors.primarycolor),
                Text(
                  "${model.address}",
                  style: AppTextStyles.w600
                      .copyWith(color: Colors.black54, fontSize: 15),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTemplate(
                  color: AppColors.green,
                  text1: 'التفاصيل',
                  onPressed: () {
                    // navigateTo(context, MapScreen());
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonTemplate(
                    color: AppColors.green,
                    minwidth: 50,
                    text1: 'شاركنا رأيك',
                    onPressed: () {
                      UID != null
                          ? navigateTo(context, RatingView(model: model,))
                          : showMyDialog(
                              message: " تسجيل الدخول لحجز",
                              context: context,
                              ontap: () {
                                navigateAndFinished(context, RegistScreen());
                              });
                    }),
                ButtonTemplate(
                    color: AppColors.green,
                    minwidth: 50,
                    text1: 'احجز الأن',
                    onPressed: () {
                      UID != null
                          ? navigateTo(context, ReversationView(model: model,))
                          : showMyDialog(
                              message: " تسجيل الدخول لحجز",
                              context: context,
                              ontap: () {
                                navigateAndFinished(context, RegistScreen());
                              });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
