import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/User/Events/get_cubit/state.dart';
import 'package:visit_medina/features/registration/getUser_cubit/cubit.dart';

import '../../../../models/addeventmodel.dart';
import '../../../../shared/components/end_point.dart';

class GetAllEventCubit extends Cubit<GetAllEventStates> {
  GetAllEventCubit() : super(GetAllEventInitialState());

  static GetAllEventCubit get(context) => BlocProvider.of(context);
  List<EventModel> allPosts = [];

  void getAllEvent(String? event) {
    emit(GetAllEventOrPlaceLoadingState());

    FirebaseFirestore.instance
        .collection('posts')
        .where(
          "accept",
          isEqualTo: true,
        )
        .where("event", isEqualTo: event)
        .get()
        .then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        allPosts.add(EventModel(
            accept: element["accept"],
            address: element["address"],
            postImage: element["postImage"],
            type: element["type"],
            time: element["time"],
            price: element["price"],
            name: element["name"],
            nameEvent: element["nameEvent"],

            number: element["number"],
            description: element["description"],
            event: element["event"],
            date: element["date"],
            docuId: element.id,
            uId: element["uId"]));
      });
      emit(GetAllEventOrPlaceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllEventOrPlaceErrorState(error.toString()));
    });
  }


  void reservation({
    required String? dateTime,
    required String? name_event,
    required String? price,
    required int? number,
    required DateTime? time,
    required String? date,
    required String? uIdOwner,
  }) {
    emit(ReservationLoadingState());


    FirebaseFirestore.instance
        .collection('reservation')
        .add({
      'name_event': name_event,
      'uIdUser': UID,
      'price': price,
      'number': number,
      'time': time,
      'dateTime': dateTime,
      'date': date,
      'uIdOwner': uIdOwner,
    })
        .then((value) {
      emit(ReservationSuccessState());
    }).catchError((error) {
      emit(ReservationErrorState(error));
    });
  }  void rating({
    required String? name_event,
    required double? rating,
    required String? title,
    required String? uIdOwner,
  }) {
    emit(RatingLoadingState());


    FirebaseFirestore.instance
        .collection('rating')
        .add({
      'name_event': name_event,
      'name_user': NameUser,
      'uIdUser': UID,
      'rating': rating,
      'title': title,
      'uIdOwner': uIdOwner,
    })
        .then((value) {
      emit(RatingSuccessState());
    }).catchError((error) {
      emit(RatingErrorState(error));
    });
  }



}
