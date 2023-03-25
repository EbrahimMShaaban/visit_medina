import 'package:flutter/material.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'event_details.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          navigateTo(context, const EventDetails());
        },
        child:  Container(
          height: 200,
          padding: EdgeInsets.all(10),
          margin:  EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.greenlight,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AppImages.sekka,
                          )),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    AppImages.sekka,
                    // width: 140,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('سكة حد يد الحجاز',
                      style: AppTextStyles.bold
                          .copyWith(color: AppColors.green, fontSize: 22)),
                  Icon(
                    Icons.favorite_outline,
                    size: 35,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
