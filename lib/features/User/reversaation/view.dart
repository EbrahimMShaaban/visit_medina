import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import 'finalres.dart';

class ReversationView extends StatelessWidget {
   ReversationView({Key? key}) : super(key: key);
   final TextEditingController controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حجز'),
      ),
      body: Column(
        children: [
          Image.asset(
            AppImages.sekka,
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            height: MediaQueryHelper.sizeFromHeight(context, 3),
            fit: BoxFit.fitWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('التاريخ :',
                style: AppTextStyles.w800.copyWith(
                    color: AppColors.primarycolor,fontSize: 15
                ),)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child:TextFieldTemplate(hintText: '', controller: controller)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('عدد الأفراد:',
                style: AppTextStyles.w800.copyWith(
                    color: AppColors.primarycolor,fontSize: 15
                ),)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: TextFieldTemplate(hintText: '', controller: controller)
                ),
              ),
            ],
          ), Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('الوقت :',
                style: AppTextStyles.w800.copyWith(
                    color: AppColors.primarycolor,fontSize: 15
                ),)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: TextFieldTemplate(hintText: '', controller: controller)
                ),
              ),
            ],
          ),
           ButtonTemplate(color: AppColors.green, text1: 'متابعة الحجز', onPressed: (){
             navigateTo(context, FinalReserv());

           })


        ],
      ),
    );
  }
}
