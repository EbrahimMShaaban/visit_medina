import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visit_medina/features/registration/Login/loginscreen.dart';
import 'package:visit_medina/features/registration/signUp/SignUpScrren.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';

import '../../../shared/components/end_point.dart';
import '../../../shared/network/local/shared_preferences.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  _RegistScreenState createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  @override

  Widget build(BuildContext context) {
    UID = CacheHelper.getData(key: 'uId');
    TYPE = CacheHelper.getData(key: 'type');
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: const Image(
                      image: AssetImage(
                        AppImages.Logo,
                      ),
                      height: 230,
                    ),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1,
                    child: Column(children: const [
                      SizedBox(
                        height: 65,
                        child: (TabBar(
                          labelColor: AppColors.green,
                          unselectedLabelColor: AppColors.greyDark,
                          isScrollable: true,
                          labelStyle: TextStyle(
                              fontSize: 25,
                              height: 1.5,
                              fontWeight: FontWeight.w800),
                          tabs: <Widget>[
                            Tab(
                              text: 'تسجيل جديد',
                            ),
                            Tab(
                              text: "تسجيل دخول",
                            ),
                          ],
                        )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            child: TabBarView(
                              children: [
                                SignUpScreen(),
                                LoginScreen(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  // Expanded(
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
