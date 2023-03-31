// import 'dart:html';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:visit_medina/features/administrator/Activities/postEvent_cubit/state.dart';
//
// import '../../../../models/addeventmodel.dart';
// import '../../../../shared/components/end_point.dart';
//
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// class AddEventCubit extends Cubit<AddEventStates> {
//   AddEventCubit() : super(AddEventInitialState());
//
//   static AddEventCubit get(context) => BlocProvider.of(context);
//   File? postImage;
//   var picker = ImagePicker();
//   Future<void> getPostImage() async {
//     final pickedFile = await picker.pickImage(
//       source: ImageSource.gallery,
//     );
//
//     if (pickedFile != null) {
//       postImage = File(pickedFile.path);
//       emit(PostImagePickedSuccessState());
//     } else {
//       print('No image selected');
//       emit(PostImagePickedErrorState());
//     }
//   }
//
//   void removePostImage() {
//     postImage = null;
//     emit(RemovePostImageSuccessState());
//   }
//
//   // String profileImageUrl = '';
//
//
//
//   // String coverImageUrl = '';
//
//
//
//   void uploadPostImage({
//     required String dateTime,
//     required String text,
//   }) {
//     emit(AddEventOrPlaceLoadingState());
//
//     firebase_storage.FirebaseStorage.instance
//         .ref()
//         .child(
//       'posts/${Uri.file(postImage!.path).pathSegments.last}',
//     )
//         .putFile(postImage)
//         .then((value) {
//       value.ref.getDownloadURL().then((value) {
//         print(value);
//         createPost(
//           dateTime: dateTime,
//           text: text,
//           postImage: value,
//         );
//       }).catchError((error) {
//         emit(AddEventOrPlaceErrorState(error));
//       });
//     }).catchError((error) {
//       emit(AddEventOrPlaceErrorState(error));
//     });
//   }
//
//   void createPost({
//     required String dateTime,
//     required String text,
//     String? postImage,
//   }) {
//     emit(AddEventOrPlaceLoadingState());
//
//     AddEventModel postModel = AddEventModel(
//       uId:UID,
//       dateTime: dateTime,
//       postText: text,
//       postImage: postImage ?? '',
//     );
//
//     FirebaseFirestore.instance
//         .collection('posts')
//         .add(postModel.toMap())
//         .then((value) {
//       emit(AddEventOrPlaceSuccessState());
//     }).catchError((error) {
//       emit(AddEventOrPlaceErrorState(error));
//     });
//   }
//
//
//
//
// }
