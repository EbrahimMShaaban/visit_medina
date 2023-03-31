import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقرير احصائي عن الحجوزات"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 1,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "يناير",
            style: AppTextStyles.bold
                .copyWith(color: AppColors.primarycolor, fontSize: 33),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("عدد الحجوزات :",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primarycolor,fontSize: 25)),
              SizedBox(width: 10,),
              Text(
                "100",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
