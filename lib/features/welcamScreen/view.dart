import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visit_medina/features/registration/regist_screen/view.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../shared/components/navigator.dart';
import '../../shared/network/local/shared_preferences.dart';
import '../../shared/styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: AppImages.Welcam,
        title: 'Plant Growing',
        body:
            (" تطبيق VisitMedina يساعد السائح فى التعرف على الاماكن السياحية والتاريخية التى يرغب فى زيارتها بالاضافة الى تمكين المستخدم من الانغماس فى ثقافات المديبنة المنورة المختلفة وتصفح الانشطة المحلية والسياحية .")),
    BoardingModel(
        image: AppImages.Welcam,
        title: 'Plant Growing',
        body:
            'يقدم تطبيق VisitMedina العديد من الخدمات السياحية التى يحتاجها السائح خلال زيارتة للمدينة المنورة مثل الاطلاع على الاماكن السياحية والفاعليات والحجز والدفع وتقيم الأماكن وابداء الأراء عليها ورؤية أحوال الطقس . '),
    BoardingModel(
        image: AppImages.Welcam,
        title: 'Plant Growing',
        body:
            ' تطبيق VisitMedina يساعد السائح فى التعرف على الاماكن السياحية والتاريخية التى يرغب فى زيارتها بالاضافة الى تمكين المستخدم من الانغماس فى ثقافات المديبنة المنورة المختلفة وتصفح الانشطة المحلية والسياحية.'),
  ];

  bool isLast = false;
  IconData nextIcon = Icons.arrow_forward;
  var boardController = PageController();

  void finishOnBoarding() {
    navigateAndFinished(context, RegistScreen());
    // CacheHelper.saveData(key: 'token', value: true).then((value) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == 2) {
                      setState(() {
                        isLast = true;
                        nextIcon = Icons.done;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                        nextIcon = Icons.arrow_forward;
                      });
                    }
                  },
                  controller: boardController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isLast
                            ? SizedBox(height: 50)
                            : TextButton(
                                onPressed: () {
                                  finishOnBoarding();
                                },
                                child: Text("تخطي",
                                    style: AppTextStyles.w800.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.green,
                                        fontSize: 18)),
                              ),
                        SmoothPageIndicator(
                          controller: boardController,
                          count: boarding.length,
                          effect: WormEffect(
                            activeDotColor: AppColors.green,
                            //HexColor('2BD596'),
                            spacing: 25,
                            dotWidth: 9,
                            dotHeight: 9,
                          ),
                        ), // بياخد كل المسافة اللي فالنص
                        FloatingActionButton(
                          mini: true,
                          backgroundColor: AppColors.green,
                          onPressed: () {
                            if (isLast) {
                              finishOnBoarding();
                            } else {
                              boardController.nextPage(
                                  duration: Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastOutSlowIn);
                            }
                          },
                          child: Icon(
                            nextIcon,
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.9,
            // color: Colors.yellow,
            child: Image.asset(
              '${model.image}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VisitMedina',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
                ),
                Text(
                  '${model.body}',
                  style: TextStyle(
                    height: 2,
                      fontWeight: FontWeight.w100,
                      fontSize: 15.0,
                      color: AppColors.black),
                ),
              ],
            ),
          )
        ],
      );
}
