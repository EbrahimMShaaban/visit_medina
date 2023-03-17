
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
class HomeSceen extends StatelessWidget {
  const HomeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مرحبا سارة",
                style: AppTextStyles.bold
                    .copyWith(color: AppColors.green, fontSize: 30)),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),

                  child: Image.asset(   height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2.5,
                    "assets/images/Home.png",
                    fit: BoxFit.cover,
                    // fit: BoxFit.cover,
                  ),
                ),        ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),

                  child: Image.asset(   height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2.5,
                    "assets/images/Home2.png",
                    fit: BoxFit.cover,
                    // fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
