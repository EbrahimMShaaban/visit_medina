
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/Home/Home.dart';
import 'package:visit_medina/features/Home/layout/state.dart';


import '../Activities and events.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();

  int currentIndex = 0;

  changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeNavBottomState());
  }

  List screen = [
    HomeSceen(),
    HomeSceen(),
    ActivitiesAndEvents(),
    ActivitiesAndEvents(),
  ];
/*
  *
  *  int currentIndex = 0;
  int currentTab = 0;
  Widget currentscreen = HomeScreen();
  List<Widget> screen =
  [
    HomeScreen(),
    Directoory(),
    Settings(),
    ProfileScreen()
  ];

   changeBottomNav(int index) {
    print(index);
    currentscreen = screen[index];
    currentIndex = index;
    emit(ChangeNavBottomState());
    print('current index is $currentIndex');
    print(' index is $index');
  }*/
}
