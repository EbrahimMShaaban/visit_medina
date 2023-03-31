import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'event_details.dart';

class ActivityItem extends StatefulWidget {
  ActivityItem({Key? key}) : super(key: key);

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  bool favorite = false;

  Widget build(BuildContext context) {
    print(UID);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          navigateTo(context, const EventDetails());
        },
        child: Container(
          height: 130,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.greenlight,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      AppImages.sekka,
                    )),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('سكة حد يد الحجاز',
                      style: AppTextStyles.bold
                          .copyWith(color: AppColors.green, fontSize: 22)),
                  UID !=null ?   InkWell(
                    onTap: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        favorite
                            ? Icons.favorite_outlined
                            : Icons.favorite_border,
                        size: 35,
                      ),
                    ),
                  ):SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
