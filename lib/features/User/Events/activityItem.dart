import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../models/addeventmodel.dart';
import 'event_details.dart';
import 'get_cubit/cubit.dart';
import 'get_cubit/state.dart';

class ActivityItem extends StatefulWidget {
  ActivityItem({Key? key, required this.model}) : super(key: key);
  final EventModel model;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
@override
  bool? favorite ;
  void initState() {
    // TODO: implement initState
    super.initState();
   favorite = widget.model.favorite;

  }
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllEventCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            navigateTo(context, EventDetails(model: widget.model,));
          },
          child: Container(
            height: 140,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.greenlight,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag:  'hero-custom-tween',
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "${widget.model.postImage}",
                            )),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(             width: MediaQuery
                        .of(context)
                        .size
                        .width / 2.8,
                      child: Text(
                          "${widget.model.nameEvent}",
                          maxLines: 2,
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.green, fontSize: 17)),
                    ),
                    UID != null
                        ?

                    BlocConsumer<GetAllEventCubit, GetAllEventStates>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {

                        print("${widget.model.favorite}""  Build");

                        return InkWell(
                          onTap: () {


                            setState(() {
                              favorite = !favorite!;
                              GetAllEventCubit.get(context).postFavourite(
                                  "${widget.model.docuId}", favorite!);
                            });
                          },
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              favorite!
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_border,
                              size: 35,
                            ),
                          ),
                        );
                      },
                    )
                        : SizedBox(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
