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
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      CacheHelper.saveData(
          key: 'name', value:userModel!.name);
      emit(GetUserSuccessState(userModel));

    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }
}
