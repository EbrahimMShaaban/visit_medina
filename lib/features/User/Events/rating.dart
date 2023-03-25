import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/styles/images.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

@immutable
class RatingView extends StatelessWidget {
  RatingView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  actions: [
        Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.green,
                )))
      ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          //  child: Image.asset(AppImages.drawer, height: 30),
        ),
        title: Text('شاركنا رأيك'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
          child: Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.green),
                  child: Center(
                      child: Text("كيف كانت تجربتك مع سكة حد يد الحجاز ؟",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold.copyWith(fontSize: 20))),
                ),
                Container(
                    width: MediaQueryHelper.sizeFromWidth(context, 1),
                    child: TextFieldTemplate(
                      hintText: '',
                      controller: controller,
                      lines: 7,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AppImages.rating,
                        width: 30,
                      ),
                      Image.asset(
                        AppImages.rating,
                        width: 30,
                      ),
                      Image.asset(
                        AppImages.rating,
                        width: 30,
                      ),
                      Image.asset(
                        AppImages.rating,
                        width: 30,
                      ),
                      Image.asset(
                        AppImages.rating,
                        width: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 70,
                  child: ButtonTemplate(
                      color: AppColors.green,
                      minwidth: 50,

                      text1: 'حفظ',
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
