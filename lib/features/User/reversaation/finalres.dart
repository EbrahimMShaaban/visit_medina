import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:visit_medina/features/User/reversaation/payment_card.dart';

import '../../../models/addeventmodel.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../Events/get_cubit/cubit.dart';
import '../Events/get_cubit/state.dart';

class FinalReserv extends StatelessWidget {
  const FinalReserv(
      {Key? key,
      required this.model,
      required this.date,
      required this.time,
      required this.personsnum})
      : super(key: key);
  final EventModel model;
  final String? date;
  final DateTime? time;
  final int? personsnum;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllEventCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.green,
                    )))
          ],
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            //  child: Image.asset(AppImages.drawer, height: 30),
          ),
          title: Text('إكمال الحجز'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                Hero(
                  tag:  'hero-custom-tween',
                  child: Image.network(
                    "${model.postImage}",
                    width: MediaQueryHelper.sizeFromWidth(context, 1),
                    height: MediaQueryHelper.sizeFromHeight(context, 3),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greenlight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.access_time), Text(intl.DateFormat('hh:mm a').format(time!))],
                      ),
                      VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          Text("$date")
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.person),
                          Text(
                            "$personsnum" '  عدد الزوار',
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greenlight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('السعر'),
                          Text("${model.price}" ' ريال سعودي' ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الضريبة'),
                          Text('00.0 ريال سعودي'),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الإجمالي'),
                          Text("${model.price}" ' ريال سعودي'),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('السياسات', style: AppTextStyles.w800),
                  ],
                ),
                Text(
                    'يتم إلغاء الحجز في حال التأخير عن الموعد المحدد أكثر من 15 دقيقة  \n  المبلغ المفدوع غير مسترد ولا يشمل قيمة الضربة الإضافية'),
                BlocConsumer<GetAllEventCubit, GetAllEventStates>(
                  listener: (context, state) {
                    print(state);
                    if (state is ReservationSuccessState) {
                      navigateTo(context, PaymentContainer());
                    }
                  },
                  builder: (context, state) {
                    return ButtonTemplate(
                        color: AppColors.green,
                        text1: 'إتمام الحجز',
                        onPressed: () {
                          var nowDateTime = DateTime.now();

                          String? price = model.price;
                          GetAllEventCubit.get(context).reservation(
                              dateTime: nowDateTime.toString(),
                              name_event: model.nameEvent,
                              price: price,
                              number: personsnum,
                              time: time,
                              date: date,
                              uIdOwner: model.uId);
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
