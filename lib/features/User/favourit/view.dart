import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/Events/activityItem.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../../registration/regist_screen/view.dart';
import '../Events/event_details.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المفضلة'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            navigateTo(context, const EventDetails());
          },
          child: Container(
            height: 130,
            padding: EdgeInsets.all(15),
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
                        style: AppTextStyles.bold.copyWith(
                            color: AppColors.green, fontSize: 22)),
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.favorite_outlined,
                          size: 35,
                        ),
                      ),
                    ),
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
