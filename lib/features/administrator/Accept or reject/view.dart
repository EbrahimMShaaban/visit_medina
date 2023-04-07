import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/get_cubit/state.dart';
import 'package:visit_medina/models/addeventmodel.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'get_cubit/cubit.dart';

class Accept_Or_Reject extends StatefulWidget {
  const Accept_Or_Reject({Key? key}) : super(key: key);

  @override
  State<Accept_Or_Reject> createState() => _Accept_Or_RejectState();
}

class _Accept_Or_RejectState extends State<Accept_Or_Reject> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEventCubit()..getEvent(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("قبول أو رفض حدث"),
        ),
        body: BlocConsumer<GetEventCubit, GetEventStates>(
          listener: (context, state) {
            // TODO: implement listener
            print(state);
          },
          builder: (context, state) {
            List<EventModel> eventModel= GetEventCubit.get(context).posts;

            return SafeArea(
                child: state is! GetEventOrPlaceSuccessState
                    ? LinearProgressIndicator()
                    : ListView.builder(
                        itemCount: GetEventCubit.get(context).posts.length,
                        itemBuilder: (context, index) {
                          return
                            ContainerAcceptOrReject(
                            model: eventModel[index],
                            onPressedAccept: () {
                              GetEventCubit.get(context).AcceptEvent("${GetEventCubit.get(context).posts[index].docuId}");
                            },
                            onPressedRemove: () {
                              GetEventCubit.get(context).RemoveEvent("${GetEventCubit.get(context).posts[index].docuId}");

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
      {Key? key,
      required this.model,
      this.onPressedAccept,
      this.onPressedRemove})
      : super(key: key);
  final EventModel model;
  final Function()? onPressedAccept;
  final Function()? onPressedRemove;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:NetworkImage("${widget.model.postImage}"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.model.name}",
                      style: AppTextStyles.bold.copyWith(
                          color: AppColors.primarycolor, fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "نوع الحدث: ",
                        style: AppTextStyles.bold.copyWith(
                            color: AppColors.primarycolor, fontSize: 19),
                        // style: AppTextStyles.w300.apply(
                        //   color: Colors.black,
                        // ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.model.event,
                            style: AppTextStyles.bold.copyWith(
                                color: AppColors.greyDark, fontSize: 16),
                            //  style: AppTextStyles.lrTitles
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "النوع: ",
                        style: AppTextStyles.bold.copyWith(
                            color: AppColors.primarycolor, fontSize: 19),
                        // style: AppTextStyles.w300.apply(
                        //   color: Colors.black,
                        // ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.model.type,
                            style: AppTextStyles.bold.copyWith(
                                color: AppColors.greyDark, fontSize: 16),
                            //  style: AppTextStyles.lrTitles
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 20, color: Colors.black),
          RichText(
            text: TextSpan(
              text: "الرقم: ",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 22),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.model.number,
                  style: AppTextStyles.bold.copyWith(
                    color: AppColors.greyDark,
                    fontSize: 16,
                  ),

                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),   RichText(
            text: TextSpan(
              text: "السعر: ",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 22),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.model.price,
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
                  "${widget.model.address}",
                  maxLines: 4,
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
                onPressed: widget.onPressedAccept!,
                minheight: 50,
                minwidth: MediaQuery.of(context).size.width / 3,
              ),
              ButtonTemplate(
                color: Colors.red,
                text1: "رفض",
                onPressed: widget.onPressedRemove!,
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
