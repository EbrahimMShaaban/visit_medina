import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التعليقات"),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 2,
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
  TextEditingController controller =TextEditingController();
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
                    "Ahmed ",
                    style: AppTextStyles.bold
                        .copyWith(color: AppColors.primarycolor, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
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
              text: "التعليق :  ",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text:
"الخدمة سيئة والفرش مب مريح",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16,),

                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          ButtonTemplate(
            color: AppColors.primarycolor,
            text1: "رد",
            onPressed: () {
              commentReply(context,controller);

            },
            minheight: 50,
            minwidth: MediaQuery.of(context).size.width / 3,
          )
        ],
      ),
    );
  }
}
