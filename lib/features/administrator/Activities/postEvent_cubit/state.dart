abstract class AddEventStates {}

class AddEventInitialState extends AddEventStates {}

class AddEventOrPlaceLoadingState extends AddEventStates {}

class AddEventOrPlaceSuccessState extends AddEventStates {}

class AddEventOrPlaceErrorState extends AddEventStates {
  late final String error;

  AddEventOrPlaceErrorState(this.error);
}class uploadPostImageLoadingState extends AddEventStates {}

class uploadPostImageSuccessState extends AddEventStates {}

class uploadPostImageErrorState extends AddEventStates {
  late final String error;

  uploadPostImageErrorState(this.error);
}


class PostImagePickedSuccessState extends AddEventStates {}

class PostImagePickedErrorState extends AddEventStates {


}



class RemovePostImageSuccessState extends AddEventStates {}