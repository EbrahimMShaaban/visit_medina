import 'package:flutter/material.dart';
import 'package:visit_medina/features/registration/regist_screen/view.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/styles/images.dart';
import 'features/User/Events/view.dart';


class ViewScrren extends StatelessWidget {
  const ViewScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Image.asset(AppImages.Logo,height: 70),

        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: IconButton(
              onPressed: () {
               navigateTo(context, RegistScreen());
              },
              icon: Icon(
                Icons.login_sharp,
                color: Colors.red,
              )),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, ActivityView());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 100,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.green),
                    child: Center(
                        child: Text(" الفعاليات والأنشطة",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold.copyWith(fontSize: 20))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, ActivityView());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 100,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.green),
                    child: Center(
                        child: Text(" الاماكن السياحية",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bold.copyWith(fontSize: 20))),
                  ),
                ),

                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class ContainerData extends StatelessWidget {
  final String text1;
  final String text2;

  const ContainerData({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text(text1,
                  maxLines: 1,
                  style: AppTextStyles.w600.copyWith(fontSize: 18))),
          Expanded(
            flex: 5,
            child: Container(
              height: 45,
              // width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.greenlight),
              child: Center(
                child: Text(text2,
                    style: AppTextStyles.bold
                        .copyWith(fontSize: 13, color: AppColors.green)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
