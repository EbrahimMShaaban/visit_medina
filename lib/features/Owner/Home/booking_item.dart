import 'package:flutter/material.dart';
import 'package:visit_medina/models/OrdersModel.dart';
import 'package:intl/intl.dart' as intl;
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';

class BookingItem extends StatefulWidget {
  const BookingItem({Key? key, required this.ordersModel}) : super(key: key);
  final OrdersModel ordersModel;

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
          Text("${widget.ordersModel.name_event}",
              style: AppTextStyles.bold
                  .copyWith(color: AppColors.green, fontSize: 19)),
          SizedBox(
            height: 10,
          ),
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
                      text: "${widget.ordersModel.number}",
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
                      text: "${widget.ordersModel.date}",
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
                      text:
                          "${intl.DateFormat("hh:mm a").format(widget.ordersModel.time!)}",
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
            height: 10,
          ),
          Divider(height: 20, color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                          text: "${widget.ordersModel.price}",
                          style: AppTextStyles.bold.copyWith(
                            color: AppColors.white,
                            fontSize: 16,
                          ),

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
