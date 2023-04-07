import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/administrator/Accept%20or%20reject/get_cubit/state.dart';

import '../../../../models/addeventmodel.dart';
import '../../../../shared/components/end_point.dart';

class GetEventCubit extends Cubit<GetEventStates> {
  GetEventCubit() : super(GetEventInitialState());

  static GetEventCubit get(context) => BlocProvider.of(context);
  List<EventModel> posts = [];

  // List<String> postsId = [];
  // List<int> likes = [];

  void getEvent() {
    emit(GetEventOrPlaceLoadingState());

    FirebaseFirestore.instance
        .collection('posts')
        .where("accept", isEqualTo: false)
        .get()
        .then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        print(element.id + "Dddddddddddd");
        posts.add(EventModel(
            accept: element["accept"],
            address: element["address"],
            postImage: element["postImage"],
            type: element["type"],
            time: element["time"],
            price: element["price"],
            name: element["name"],
            number: element["number"],
            description: element["description"],
            event: element["event"],
            date: element["date"],
            docuId: element.id,
            uId: element["uId"]));
        // element.reference.collection('posts').get().then((value) {
        //   // likes.add(value.docs.length);
        //   // postsId.add(element.id);
        //
        // }).catchError((error) {});
      });
      emit(GetEventOrPlaceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetEventOrPlaceErrorState(error.toString()));
    });
  }

  void AcceptEvent(String docUid) {
    print(UID);
    emit(AcceptEventLoadingState());
    FirebaseFirestore.instance.collection('posts').doc(docUid).update({
      "accept": true,
    }).then((value) {
      posts.clear();
      getEvent();
      emit(AcceptEventSuccessState());
    }).catchError((error) {
      emit(AcceptEventErrorState(error));
    });
  }

  void RemoveEvent(String docUid) {
    print(UID);
    emit(RemoveEventLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .doc(docUid)
        .delete()
        .then((value) {
      posts.clear();
      getEvent();
      emit(RemoveEventSuccessState());
    }).catchError((error) {
      emit(RemoveEventErrorState(error));
    });
  }
}
