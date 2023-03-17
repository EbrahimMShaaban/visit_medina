import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_medina/features/Home/AppLayout.dart';
import 'package:visit_medina/features/User/Profile/view.dart';
import 'package:visit_medina/features/welcamScreen/view.dart';


import 'package:visit_medina/shared/styles/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
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
      home:OnBoardingScreen()
    );
  }
}

