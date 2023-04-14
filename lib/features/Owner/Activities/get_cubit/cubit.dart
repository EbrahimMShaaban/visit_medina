import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/Owner/Activities/get_cubit/state.dart';
import 'package:visit_medina/features/administrator/Accept%20or%20reject/get_cubit/state.dart';

import '../../../../models/OrdersModel.dart';
import '../../../../models/addeventmodel.dart';
import '../../../../models/commentsModel.dart';
import '../../../../shared/components/end_point.dart';

class GetMyEventCubit extends Cubit<GetMyEventStates> {
  GetMyEventCubit() : super(GetMyEventInitialState());

  static GetMyEventCubit get(context) => BlocProvider.of(context);
  List<EventModel> myPosts = [];
  List<CommentsModel> myComments = [];
  List<OrdersModel> myOrders = [];

  void getMyEvent() {
    emit(GetMyEventOrPlaceLoadingState());

    FirebaseFirestore.instance
        .collection('posts')
        .where("accept", isEqualTo: false)
        .where("uId", isEqualTo: UID)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        myPosts.add(EventModel(
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
      });
      emit(GetMyEventOrPlaceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetMyEventOrPlaceErrorState(error.toString()));
    });
  }

  void getAllOrder() {
    emit(GetAllOrderLoadingState());
    print(UID);
    FirebaseFirestore.instance.collection('reservation').get().then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        myOrders.add(OrdersModel(
          uId: element["uIdUser"],
          name_event: element["name_event"],
          date: element["date"],
          number: element["number"],
          price: element["price"],
          time: element["time"].toDate(),
          dateTime: element["dateTime"],
          uIdUser: element["uIdUser"],
        ));
      });
      emit(GetAllOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllOrderErrorState(error.toString()));
    });
  }

  void getAllComments() {
    emit(GetAllCommentsLoadingState());

    FirebaseFirestore.instance.collection('rating').get().then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        myComments.add(CommentsModel(
            title: element["title"],
            name_event: element["name_event"],
            name_user: element["name_user"],
            rating: element["rating"],
            docuId: element.id,
            uId: element["uIdUser"]));
      });
      emit(GetAllCommentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCommentsErrorState(error.toString()));
    });
  }
}
