import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

class Accept_Or_Reject extends StatefulWidget {
  const Accept_Or_Reject({Key? key}) : super(key: key);

  @override
  State<Accept_Or_Reject> createState() => _Accept_Or_RejectState();
}

class _Accept_Or_RejectState extends State<Accept_Or_Reject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قبول أو رفض طلب المالك"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ContainerAcceptOrReject();
        },
      )),
    );
  }
}

class ContainerAcceptOrReject extends StatefulWidget {
  const ContainerAcceptOrReject({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(AppImages.person),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "احمد بهجت الباز",
                    style: AppTextStyles.bold
                        .copyWith(color: AppColors.primarycolor, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "أسم الموقع :",
                      style: AppTextStyles.bold.copyWith(
                          color: AppColors.primarycolor, fontSize: 19),
                      // style: AppTextStyles.w300.apply(
                      //   color: Colors.black,
                      // ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "  فندق البسفور المدينة",
                          style: AppTextStyles.bold.copyWith(
                              color: AppColors.greyDark, fontSize: 16),
                          //  style: AppTextStyles.lrTitles
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "نوع الحدث :",
                      style: AppTextStyles.bold.copyWith(
                          color: AppColors.primarycolor, fontSize: 19),
                      // style: AppTextStyles.w300.apply(
                      //   color: Colors.black,
                      // ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "  مكان سياحى",
                          style: AppTextStyles.bold.copyWith(
                              color: AppColors.greyDark, fontSize: 16),
                          //  style: AppTextStyles.lrTitles
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 20, color: Colors.black),
          RichText(
            text: TextSpan(
              text: "شرح الموقع :",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      "يقع هذا الفندق على بعد 3 دقائق سيراً على الأقدام من المسجد النبوي الشريف، ويضم غرفاً مزودة بتلفزيون مع قنوات فضائية",

                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16,),

                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 30, color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_rounded,
                color: AppColors.primarycolor,
                size: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  "Madina 13 Al Madina, المدينة المنور",                  maxLines: 4,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primarycolor, fontSize: 13),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonTemplate(
                color: AppColors.primarycolor,
                text1: "قبول",
                onPressed: () {},
                minheight: 50,
                minwidth: MediaQuery.of(context).size.width / 3,
              ),
              ButtonTemplate(
                color: Colors.red,
                text1: "رفض",
                onPressed: () {},
                minheight: 50,
                minwidth: MediaQuery.of(context).size.width / 3,
              )
            ],
          )
        ],
      ),
    );
  }
}
