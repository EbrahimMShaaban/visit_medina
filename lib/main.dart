import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_medina/features/Home/AppLayout.dart';
import 'package:visit_medina/features/User/Profile/view.dart';
import 'package:visit_medina/features/registration/regist_screen/view.dart';
import 'package:visit_medina/features/welcamScreen/view.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/network/local/shared_preferences.dart';


import 'package:visit_medina/shared/styles/theme.dart';
import 'package:visit_medina/viewscreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  final Widget startWidget;
  // await Future.delayed(Duration(seconds: 5));
  UID = CacheHelper.getData(key: 'uId');
  TYPE = CacheHelper.getData(key: 'type');
  OnBoarding = CacheHelper.getData(key: 'OnBoarding');

  if (OnBoarding != null) {
    if (UID != null)
      startWidget = RegistScreen();
    else
      startWidget = ViewScrren();
  } else {
    startWidget = OnBoardingScreen();
  }
  runApp( MyApp(startwidget: startWidget,));
}

class MyApp extends StatelessWidget {

  final Widget startwidget;

  const MyApp({super.key, required this.startwidget});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme:lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'), // English
          // Locale('es'), // Spanish
        ],
      home:startwidget
      // OnBoardingScreen()
    );
  }
}

