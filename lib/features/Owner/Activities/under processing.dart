import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/Owner/Home/view.dart';

import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../models/addeventmodel.dart';
import '../../administrator/Accept or reject/get_cubit/cubit.dart';
import '../../administrator/Accept or reject/get_cubit/state.dart';

class UnderProcessing extends StatefulWidget {
  const UnderProcessing({Key? key}) : super(key: key);

  @override
  State<UnderProcessing> createState() => _UnderProcessingState();
}

class _UnderProcessingState extends State<UnderProcessing> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetEventCubit()
        ..getEvent(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("طلباتى"),
        ),
        body: BlocConsumer<GetEventCubit, GetEventStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<EventModel> eventModel = GetEventCubit
                .get(context)
                .posts;

            return SafeArea(
                child: state is! GetEventOrPlaceSuccessState
                    ? Center(child: CircularProgressIndicator(),)
                    : ListView.builder(
                  itemCount: eventModel.length,
                  itemBuilder: (context, index) {
                    return ContainerAcceptOrReject(model: eventModel[index],);
                  },
                ));
          },
        ),
      ),
    );
  }
}

class ContainerAcceptOrReject extends StatefulWidget {
  const ContainerAcceptOrReject({Key? key, required this.model})
      : super(key: key);
  final EventModel model;

  @override
  State<ContainerAcceptOrReject> createState() =>
      _ContainerAcceptOrRejectState();
}

class _ContainerAcceptOrRejectState extends State<ContainerAcceptOrReject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
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
              text: "أسم الموقع :  ",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.model.nameEvent,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16),
                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "نوع الحدث :  ",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.primarycolor, fontSize: 19),
              // style: AppTextStyles.w300.apply(
              //   color: Colors.black,
              // ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.model.event,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.greyDark, fontSize: 16),
                  //  style: AppTextStyles.lrTitles
                ),
              ],
            ),
          ),
          Divider(height: 10, color: Colors.black),

              ButtonTemplate(
            color: AppColors.greenlight,
            text1: "قيد المعالجة",
            onPressed:() {

            },
            minheight: 50,
          )
        ],
      ),
    );
  }
}
