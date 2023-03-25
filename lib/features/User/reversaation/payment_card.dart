import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/Events/payment%20success.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/styles.dart';

class PaymentContainer extends StatelessWidget {
  PaymentContainer({Key? key}) : super(key: key);

  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController cvvcontroller = TextEditingController();
  TextEditingController datacontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("أضف بطاقة دفع"),
          actions: [
            
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                // padding: EdgeInsets.all(16),
                //margin: EdgeInsets.only(left: 15),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green, width: 1.0),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0) //         <--- border radius here
                      ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 10),
                      child: TextFieldTemplate(
                          hintText: "رقم البطاقة", controller: namecontroller),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "cvv",
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: 20, color: AppColors.green),
                            ),
                            Container(
                              width: 130,
                              margin: EdgeInsetsDirectional.only(top: 10),
                              child: TextFieldTemplate(
                                  hintText: "127", controller: cvvcontroller),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "تاريخ الانتهاء",
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: 17, color: AppColors.green),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(top: 10),
                              width: 130,
                              child: TextFieldTemplate(
                                  hintText: "3/2023",
                                  controller: datacontroller),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ButtonTemplate(
                  color: AppColors.green, text1: 'دفع', onPressed: () {
                    navigateAndFinished(context, PaymentSuccess());
              })
            ],
          ),
        ));
  }
}
