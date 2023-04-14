import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/registration/getUser_cubit/state.dart';

import '../../../models/user_model.dart';
import '../../../shared/components/end_point.dart';
import '../../../shared/network/local/shared_preferences.dart';

class GetUserCubit extends Cubit<GetUserStates> {
  GetUserCubit() : super(GetUserInitialState());

  static GetUserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingState());
    UID = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      // print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      CacheHelper.saveData(key: 'name', value: userModel!.name);

      print(userModel!.name);
      print("userModel!.name ");
      emit(GetUserSuccessState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  updateProfileDate({
    required String name,
    required String email,
    required context,
  }) {
    emit(UpdateProfileLoadingState());

    FirebaseFirestore.instance.collection('users').doc(UID).update({
      'name': name,
      'email': email,

    }).then((value) {
      emit(UpdateProfileSuccessState());
      getUserData();
    }).catchError((error) {
      emit(UpdateProfileErrorState(error.toString()));
    });
  }

  deleteProfileDate() async {
    emit(DeleteProfileLoadingState());
    FirebaseAuth.instance.currentUser?.delete().then((value) async {
      await FirebaseAuth.instance.signOut();
      await FirebaseFirestore.instance.collection('users').doc(UID)
          .delete()
          .then((value) => emit(DeleteProfileSuccessState()));
    }).catchError((error) {
      emit(DeleteProfileErrorState(error.toString()));
    });
  }
}
