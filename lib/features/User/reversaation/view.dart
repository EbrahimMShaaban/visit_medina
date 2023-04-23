import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:visit_medina/features/User/Events/get_cubit/cubit.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:intl/intl.dart' as intl;
import '../../../models/addeventmodel.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
import 'finalres.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class ReversationView extends StatefulWidget {
  ReversationView({Key? key, required this.model}) : super(key: key);
  final EventModel model;

  @override
  State<ReversationView> createState() => _ReversationViewState();
}

class _ReversationViewState extends State<ReversationView> {
  final TextEditingController controller = TextEditingController();
  final FixedExtentScrollController itemController =
      FixedExtentScrollController();
  int personsnum = 1;
  DateTime? _dateTime;
  String? _date;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Hero(
                tag:  'hero-custom-tween',
                child: Image.network(
                  "${widget.model.postImage}",
                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                  height: MediaQueryHelper.sizeFromHeight(context, 3.2),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        'التاريخ :',
                        style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor, fontSize: 18),
                      )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Container(

                            //   padding: EdgeInsets.all(10.0),
                            child: HorizontalCalendar(
                          date: DateTime.now(),
                          textColor: Colors.black45,
                          backgroundColor: Colors.white,
                          selectedColor: AppColors.green,
                          showMonth: true,
                          onDateSelected: (date) {
                            print(date.toString());
                            _date = date.toString();
                          },
                        ))),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
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
                              color: AppColors.primarycolor, fontSize: 18),
                        )),
                    Expanded(
                      flex: 3,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.primarycolor),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          personsnum < 2 ? null : personsnum--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.white,
                                      )),
                                  Text(
                                    '${personsnum}',
                                    style: AppTextStyles.bold.copyWith(
                                        color: AppColors.white, fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          personsnum++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.white,
                                      )),
                                ],
                              ),
                            ),
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
                        style: AppTextStyles.w800.copyWith(
                            color: AppColors.primarycolor, fontSize: 18),
                      )),
                  Expanded(
                    flex: 5,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.primarycolor),
                            child: TimePickerSpinner(
                              itemWidth: 30,
                              alignment: Alignment.center,
                              is24HourMode: false,
                              normalTextStyle: AppTextStyles.bold.copyWith(
                                  color: AppColors.greenlight, fontSize: 20),
                              highlightedTextStyle: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 20),
                              spacing: 40,
                              itemHeight: 30,
                              isForce2Digits: false,
                              onTimeChange: (time) {
                                setState(() {
                                  _dateTime = time;
                                  print(_dateTime);
                                });
                              },
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ButtonTemplate(
                    color: AppColors.green,
                    text1: 'متابعة الحجز',
                    onPressed: () {
                      if (_date ==null){

                      MotionToast.error(
                        description: Text("يجب تحد يد التاريخ"),
                      ).show(context);
                    }else
                      {navigateTo(
                          context,
                          FinalReserv(
                            model: widget.model,
                            date: _date,
                            personsnum: personsnum,
                            time: _dateTime,
                          ));}
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
