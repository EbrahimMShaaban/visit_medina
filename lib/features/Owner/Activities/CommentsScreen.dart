import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/features/Owner/Activities/get_cubit/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../models/commentsModel.dart';
import 'get_cubit/cubit.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMyEventCubit()..getAllComments(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("التعليقات"),
        ),
        body: BlocConsumer<GetMyEventCubit, GetMyEventStates>(
          listener: (context, state) {

            if (state is postAllCommentsSuccessState) {
              MotionToast.success(
                description: Text("تم ارسال ردك"),
              ).show(context);
              controller.clear();
              Navigator.pop(context);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            List<CommentsModel> myComments =
                GetMyEventCubit.get(context).myComments;

            return state is GetAllCommentsLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: ListView.builder(
                    itemCount: myComments.length,
                    itemBuilder: (context, index) {
                      print(myComments.length);
                      return ContainerAcceptOrReject(
                        myComments: myComments[index],
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppColors.white,
                                  title: const Center(child: Text('رد')),
                                  titleTextStyle: AppTextStyles.bold
                                      .apply(color: AppColors.black),
                                  //titlePadding: const EdgeInsets.symmetric(vertical: 20),
                                  // elevation: 10,
                                  insetPadding: const EdgeInsets.all(10),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          //color: AppColors.pink,
                                          ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  content: SizedBox(
                                    width: 100,
                                    child: SingleChildScrollView(
                                      child: TextFieldTemplate(
                                        hintText: 'رد على التعليق',
                                        icon: null,
                                        controller: controller,
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    state is postAllCommentsLoadingState
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Center(
                                            child: ButtonTemplate(
                                              minwidth: 100,
                                              color: AppColors.primarycolor,
                                              onPressed: () {
                                                print("ssssdddddddddddddddddddddddddddddddddddddddds");
                                                // GetMyEventCubit.get(context)
                                                //     .postAllComments(
                                                //         title: controller.text,
                                                //         doc: myComments[index].docuId);

                                                controller.clear();
                                                Navigator.pop(context);
                                                MotionToast.success(
                                                  description: Text("تم ارسال ردك"),
                                                ).show(context);
                                              },
                                              text1: 'ارسال',
                                            ),
                                          ),
                                  ],
                                );
                              });
                        },
                      );
                    },
                  ));
          },
        ),
      ),
    );
  }
}

class ContainerAcceptOrReject extends StatefulWidget {
  const ContainerAcceptOrReject(
      {Key? key, required this.myComments, required this.ontap})
      : super(key: key);
  final CommentsModel myComments;

  final Function()? ontap;

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
                    "${widget.myComments.name_user}",
                    style: AppTextStyles.bold
                        .copyWith(color: AppColors.primarycolor, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.myComments.rating}",
                        style: AppTextStyles.bold.copyWith(
                            color: AppColors.primarycolor, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ],
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
                  text: "${widget.myComments.title}",
                  style: AppTextStyles.bold.copyWith(
                    color: AppColors.greyDark,
                    fontSize: 16,
                  ),

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
            onPressed:
              widget.ontap,

            minheight: 50,
            minwidth: MediaQuery.of(context).size.width / 3,
          ),
        ],
      ),
    );
  }
}
