import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/administrator/Accept%20or%20reject/get_cubit/state.dart';

import '../../../../models/OrdersModel.dart';
import '../../../../models/addeventmodel.dart';
import '../../../../shared/components/end_point.dart';

class GetEventCubit extends Cubit<GetEventStates> {
  GetEventCubit() : super(GetEventInitialState());

  static GetEventCubit get(context) => BlocProvider.of(context);
  List<EventModel> posts = [];
  List<OrdersModel> allOrders = [];



  void getEvent() {
    emit(GetEventOrPlaceLoadingState());

    FirebaseFirestore.instance
        .collection('posts')
        .where("accept", isEqualTo: false)
        .get()
        .then((value) {
      print(value.docs.toString());

      value.docs.forEach((element) async{
        bool? favourite;
        await element.reference
            .collection("favourite")
            .where("uid", isEqualTo: UID)
            .get()
            .then((value) => value.docs.forEach((elements)async {

          favourite = elements["Favourite"];

          print("1111111111111111111111111111111111111111111111111111");
          print(favourite);
          print("1111111111111111111111111111111111111111111111111111");

        })).catchError((error) {
          print(error.toString());
        });

        posts.add(EventModel(
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
          uId: element["uId"],
          favorite: favourite??false,
        ));
        print("00000000000000");
        print(favourite);
        print("00000000000000000000000");

        emit(GetEventOrPlaceSuccessState());

      });
    }).catchError((error) {
      print(error.toString());
      emit(GetEventOrPlaceErrorState(error.toString()));
    });
  }


  void getAllOrderAdmin() {
    emit(GetAllOrderAdminLoadingState());
    print(UID);
    FirebaseFirestore.instance.collection('reservation').get().then((value) {
      print(value.docs.toString());
      value.docs.forEach((element) {
        allOrders.add(OrdersModel(
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
      emit(GetAllOrderAdminSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllOrderAdminErrorState(error.toString()));
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
