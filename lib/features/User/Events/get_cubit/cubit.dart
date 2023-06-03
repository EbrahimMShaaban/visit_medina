import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/User/Events/get_cubit/state.dart';
import 'package:visit_medina/features/registration/getUser_cubit/cubit.dart';

import '../../../../models/OrdersModel.dart';
import '../../../../models/addeventmodel.dart';
import '../../../../shared/components/end_point.dart';

class GetAllEventCubit extends Cubit<GetAllEventStates> {
  GetAllEventCubit() : super(GetAllEventInitialState());

  static GetAllEventCubit get(context) => BlocProvider.of(context);
  List<EventModel> allPosts = [];
  List<EventModel> allFavorite = [];
  List<OrdersModel> myOrders = [];

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


      value.docs.forEach((element) async{
        bool? favourite;
      await element.reference
            .collection("favourite")
            .where("uid", isEqualTo: UID)
            .get()
            .then((value) => value.docs.forEach((elements)async {

                  favourite = elements["Favourite"];

                })).catchError((error) {
          print(error.toString());
        });

      allPosts.add(EventModel(
          accept: element["accept"],
          address: element["address"],
          postImage: element["postImage"],
          type: element["type"],
        typePrice: element["typePrice"],
          time: element["time"],
          price: element["price"],
          name: element["name"],
          nameEvent: element["nameEvent"],
          number: element["number"],
          description: element["description"],
          event: element["event"],
          date: element["date"],
          docuId: element.id,
          uId: element["uId"],
        linkAddress: element["linkAddress"],
          favorite: favourite??false,
        ));
        print("00000000000000");
        print(favourite);
        print("00000000000000000000000");
        emit(GetAllEventOrPlaceSuccessState());


      });

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

    FirebaseFirestore.instance.collection('reservation').add({
      'name_event': name_event,
      'uIdUser': UID,
      'price': price,
      'number': number,
      'time': time,
      'dateTime': dateTime,
      'date': date,
      'uIdOwner': uIdOwner,
    }).then((value) {
      emit(ReservationSuccessState());
    }).catchError((error) {
      emit(ReservationErrorState(error));
    });
  }
  void getAllOrderUser() {
    emit(GetAllOrderUserLoadingState());
    print(UID);
    FirebaseFirestore.instance.collection('reservation').where("uIdUser" ,isEqualTo: UID,).get().then((value) {
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
      emit(GetAllOrderUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllOrderUserErrorState(error.toString()));
    });
  }
  void rating({
    required String? name_event,
    required double? rating,
    required String? title,
    required String? uIdOwner,
  }) {
    emit(RatingLoadingState());

    FirebaseFirestore.instance.collection('rating').add({
      'name_event': name_event,
      'name_user': NameUser,
      'uIdUser': UID,
      'rating': rating,
      'title': title,
      'uIdOwner': uIdOwner,
    }).then((value) {
      emit(RatingSuccessState());
    }).catchError((error) {
      emit(RatingErrorState(error));
    });
  }

  void postFavourite(String postId, bool favourite) {
    emit(FavouriteLoadingState());

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('favourite')
        .doc(UID)
        .set({
      'Favourite': favourite,
      'uid': UID,
    }).then((value) {
      emit(FavouriteSuccessState());
    }).catchError((error) {
      emit(FavouriteErrorState(error.toString()));
    });
  }

  void getAllFavorite() {
    emit(GetAllFavoriteLoadingState());

    FirebaseFirestore.instance.collection('posts').get().then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        element.reference
            .collection("favourite")
            .where("uid", isEqualTo: UID)
            .where("Favourite", isEqualTo: true)
            .get()
            .then((value) {
          print(value.docs.length);
          value.docs.forEach((elements) {
            allFavorite.add(EventModel(
              favorite: true,
                accept: element["accept"],
                address: element["address"],
                postImage: element["postImage"],
                type: element["type"],
                typePrice: element["typePrice"],
                time: element["time"],
                linkAddress: element["linkAddress"],
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
          emit(GetAllFavoriteSuccessState());
        });
      });
    }).catchError((error) {
      print(error.toString());
      emit(GetAllFavoriteErrorState(error.toString()));
    });
  }
}
