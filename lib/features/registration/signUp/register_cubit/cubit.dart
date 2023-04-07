import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:visit_medina/features/registration/signUp/register_cubit/state.dart';
import 'package:visit_medina/shared/components/end_point.dart';
import 'package:visit_medina/shared/network/local/shared_preferences.dart';

import '../../../../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String type,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        name: name,
        email: email,
        type: type,
        uId: value.user!.uid,
      );
      // userModel = UserModel.fromJson(value.data()!);

      emit(RegisterSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String type,
    required String uId,
  }) {
    UserModel userModell = UserModel(
      type: type,
      name: name,
      email: email,
      uId: uId,
    );
    userModel = UserModel(
      type: type,
      name: name,
      email: email,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModell.toMap())
        .then((value) {
        CacheHelper.saveData(
            key: 'type', value: type );
        CacheHelper.saveData(
            key: 'name', value: name );
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
