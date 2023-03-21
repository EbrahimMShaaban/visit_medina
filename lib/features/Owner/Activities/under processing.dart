import 'package:flutter/material.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';

import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

class UnderProcessing extends StatefulWidget {
  const UnderProcessing({Key? key}) : super(key: key);

  @override
  State<UnderProcessing> createState() => _UnderProcessingState();
}

class _UnderProcessingState extends State<UnderProcessing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلباتى"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ContainerAcceptOrReject(
            reject: true,
          ),
          ContainerAcceptOrReject(
            reject: false,
          ),

        ],
      )),
    );
  }
}

class ContainerAcceptOrReject extends StatefulWidget {
  const ContainerAcceptOrReject({Key? key, required this.reject})
      : super(key: key);
  final bool reject;

  @override
  State<ContainerAcceptOrReject> createState() =>
      _ContainerAcceptOrRejectState();
}

class _ContainerAcceptOrRejectState extends State<ContainerAcceptOrReject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 400,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "أسم الموقع :",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: "  فندق البسفور المدينة",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16),
                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "نوع الحدث :",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: "  مكان سياحى",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16),
                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),
          Divider(height: 70, color: Colors.black),
          widget.reject
              ? ButtonTemplate(
                  color: Colors.red,
                  text1: "تم الرفض",
                  onPressed: () {},
                  minheight: 50,
                )
              : ButtonTemplate(
                  color: AppColors.greenlight,
                  text1: "قيد المعالجة",
                  onPressed: () {},
                  minheight: 50,
                )
        ],
      ),
    );
  }
}
