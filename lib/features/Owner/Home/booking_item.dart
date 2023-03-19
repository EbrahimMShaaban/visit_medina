import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class BookingItem extends StatefulWidget {
  const BookingItem({Key? key}) : super(key: key);

  @override
  State<BookingItem> createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  @override
  TextEditingController controller = TextEditingController();

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
                  RichText(
                    text: TextSpan(
                        //  style: AppTextStyles.analysis_titles,
                        //    text: "+12%",
                        children: [
                          TextSpan(
                            style: AppTextStyles.bold.copyWith(
                                color: AppColors.primarycolor, fontSize: 22),
                            text: "احمد بهجت \n",
                          ),
                          TextSpan(
                              style: AppTextStyles.w600.copyWith(
                                  color: AppColors.greenlight, fontSize: 15),
                              text: "ahmed@gmail.com"),
                        ]),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "عدد الأفراد  \n",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primarycolor, fontSize: 24),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "3",
                      style: AppTextStyles.bold.copyWith(
                        color: AppColors.greyDark,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "التاريخ   \n",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primarycolor, fontSize: 24),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "19/3/2023",
                      style: AppTextStyles.bold.copyWith(
                        color: AppColors.greyDark,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: " الساعة  \n",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primarycolor, fontSize: 24),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "5:00 PM",
                      style: AppTextStyles.bold.copyWith(
                        color: AppColors.greyDark,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              //  width: 200,
              //  height: 100,
                decoration: BoxDecoration(
                    color: AppColors.primarycolor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "إجمالي السعر : ",
                      style: AppTextStyles.bold
                          .copyWith(color: AppColors.white, fontSize: 19),
                      // style: AppTextStyles.w300.apply(
                      //   color: Colors.black,
                      // ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          "300 رس",
                          style: AppTextStyles.bold
                              .copyWith(color: AppColors.white, fontSize: 16,),

                          //  style: AppTextStyles.lrTitles
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
