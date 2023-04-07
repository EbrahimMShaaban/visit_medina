import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:visit_medina/features/administrator/Activities/postEvent_cubit/state.dart';

import '../../../../models/addeventmodel.dart';
import '../../../../shared/components/end_point.dart';
import '../../../registration/getUser_cubit/cubit.dart';

class AddEventCubit extends Cubit<AddEventStates> {
  AddEventCubit() : super(AddEventInitialState());

  static AddEventCubit get(context) => BlocProvider.of(context);
  File? postImage;

  var picker = ImagePicker();

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);

      emit(PostImagePickedSuccessState());
    } else {
      print('No image selected');
      emit(PostImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageSuccessState());
  }

  void uploadPostImage({
    required String dateTime,
    required String address,
    required String description,
    required bool accept,
    required String price,
    required String number,
    required String time,
    required String date,
    required String event,
    required String type,
    required String? name,
  }) {
    emit(AddEventOrPlaceLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('/license${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {

      print("${value.storage}" + "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");

      value.ref.getDownloadURL().then((value) {
        print("${value}" + "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
        createPost(
            dateTime: dateTime,
            address: address,
            description: description,
            accept: accept,
            price: price,
            number: number,
            time: time,
            date: date,
            event: event,
            name: name,
            type: type,
            postImage: value);
      }).catchError((error) {
        emit(AddEventOrPlaceErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(AddEventOrPlaceErrorState(error.toString()));
    });
  }

  void createPost({
    required String dateTime,
    required String address,
    required String description,
    required bool accept,
    required String price,
    required String number,
    required String time,
    required String date,
    required String event,
    required String? name,
    required String type,
    String? postImage,
  }) {
    emit(AddEventOrPlaceLoadingState());


    FirebaseFirestore.instance
        .collection('posts')
        .add({
      'address': address,
      'uId': UID,
      'description': description,
      'accept': accept,
      'price': price,
      'number': number,
      'time': time,
      'dateTime': dateTime,
      'date': date,
      'postImage': postImage,
      'type': type,
      'event': event,
      'name': name,
    })
        .then((value) {
      emit(AddEventOrPlaceSuccessState());
    }).catchError((error) {
      emit(AddEventOrPlaceErrorState(error));
    });
  }
}
