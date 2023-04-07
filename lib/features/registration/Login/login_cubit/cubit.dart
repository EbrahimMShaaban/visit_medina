import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/registration/Login/login_cubit/state.dart';

import '../../../../models/user_model.dart';
import '../../../../shared/components/end_point.dart';
import '../../../../shared/network/local/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      UID = CacheHelper.saveData(key: 'type', value: value.user!.uid);
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .get()
          .then((value) {
        userModel = UserModel.fromJson(value.data()!);
        emit(LoginSuccessState(userModel));
      });
      // print(value.user!.email);
      // print(value.user!.uid);
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));

    });
  }
}
