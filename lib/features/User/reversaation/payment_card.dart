import 'package:flutter/material.dart';
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
      appBar: AppBar(),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.green),
            child: Text('pay with Credit/Debit Card',
                style: AppTextStyles.w800.copyWith(color: Colors.cyanAccent)),
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
                      hintText: "الاسم بالكامل", controller: namecontroller),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "cvv",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 15, color: Colors.red),
                        ),
                        Container(
                          width: 130,
                          margin: EdgeInsetsDirectional.only(top: 10),
                          child: TextFieldTemplate(
                              hintText: "0552", controller: cvvcontroller),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تاريخ الانتهاء",
                          style: AppTextStyles.bold.copyWith(fontSize: 15),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 10),
                          width: 130,
                          child: TextFieldTemplate(
                              hintText: "3/2023", controller: datacontroller),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
