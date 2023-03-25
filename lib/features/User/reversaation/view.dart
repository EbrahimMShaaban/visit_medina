import 'package:flutter/material.dart';
import 'package:horizontalcalender/horizontalcalendar.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import 'finalres.dart';

class ReversationView extends StatefulWidget {
  ReversationView({Key? key}) : super(key: key);

  @override
  State<ReversationView> createState() => _ReversationViewState();
}

class _ReversationViewState extends State<ReversationView> {
  final TextEditingController controller = TextEditingController();
  final FixedExtentScrollController itemController =
      FixedExtentScrollController();
  int personsnum = 0;

  // final TextEditingController controller1 =TextEditingController();
  // final TextEditingController controller2 =TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('حجز'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppImages.sekka,
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              height: MediaQueryHelper.sizeFromHeight(context, 3.2),
              fit: BoxFit.fitWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'التاريخ :',
                      style: AppTextStyles.w800
                          .copyWith(color: AppColors.primarycolor, fontSize: 15),
                    )),
                Expanded(
                  flex: 3,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Container(
                          // height: 160,
                          // width: 300,
                          //   padding: EdgeInsets.all(10.0),
                          child: HorizontalCalendar(
                              dateTextStyle: AppTextStyles.w600,
                              dayTextStyle: AppTextStyles.w600,
                              monthTextStyle: AppTextStyles.w600
                                  .copyWith(color: Colors.black),
                              selectedDayStyle: AppTextStyles.w600
                                  .copyWith(color: AppColors.white),
                              selectedDateStyle: AppTextStyles.w600
                                  .copyWith(color: Colors.black),
                              DateTime.now(),
                              width: MediaQuery.of(context).size.width * .2,
                              height: 120,
                              selectionColor: AppColors.green,
                              itemController: itemController))),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        'عدد الأفراد:',
                        style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor, fontSize: 15),
                      )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    personsnum < 1 ? null : personsnum--;
                                  });
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            Text('${personsnum}'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    personsnum++;
                                  });
                                },
                                icon: const Icon(Icons.arrow_forward_ios)),
                          ],
                        )),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'الوقت :',
                      style: AppTextStyles.w800
                          .copyWith(color: AppColors.primarycolor, fontSize: 15),
                    )),
                Expanded(
                  flex: 3,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: TextFieldTemplate(
                          hintText: '', controller: controller3)),
                ),
              ],
            ),
            ButtonTemplate(
                color: AppColors.green,
                text1: 'متابعة الحجز',
                onPressed: () {
                  navigateTo(context, FinalReserv());
                })
          ],
        ),
      ),
    );
  }
}
