import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_medina/features/welcamScreen/view.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/network/local/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:visit_medina/shared/styles/theme.dart';
import 'package:visit_medina/viewscreen.dart';

import 'features/Owner/Home/view.dart';
import 'features/User/view.dart';
import 'features/administrator/Home/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Widget? startWidget;
  // await Future.delayed(Duration(seconds: 5));
  UID = CacheHelper.getData(key: 'uId');
  TYPE = CacheHelper.getData(key: 'type');
  NameUser = CacheHelper.getData(key: 'name');
  OnBoarding = CacheHelper.getData(key: 'OnBoarding');

  if (OnBoarding != null) {
    print(UID);
    print(TYPE);
    print(NameUser);

    if (UID != null) {
      if (TYPE == "user") startWidget = VisitorView();
      if (TYPE == "owner") startWidget = HomeOwner();
      if (TYPE == "admin") startWidget = HomeAdmin();
      if (TYPE == "admin2") startWidget = HomeAdmin();
    } else {
      startWidget = ViewScrren();
    }
  }
  else {
    startWidget = OnBoardingScreen();
  }
  runApp(MyApp(
    startwidget: startWidget!,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;

  const MyApp({super.key, required this.startwidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'), // English
          // Locale('es'), // Spanish
        ],
        home: startwidget
        // OnBoardingScreen()
        );
  }
}
