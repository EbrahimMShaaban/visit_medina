abstract class GetEventStates {}

class GetEventInitialState extends GetEventStates {}

class GetEventOrPlaceLoadingState extends GetEventStates {}

class GetEventOrPlaceSuccessState extends GetEventStates {}

class GetEventOrPlaceErrorState extends GetEventStates {
  late final String error;

  GetEventOrPlaceErrorState(this.error);
}class AcceptEventLoadingState extends GetEventStates {}

class AcceptEventSuccessState extends GetEventStates {}

class AcceptEventErrorState extends GetEventStates {
  late final String error;

  AcceptEventErrorState(this.error);
}
class RemoveEventLoadingState extends GetEventStates {}

class RemoveEventSuccessState extends GetEventStates {}

class RemoveEventErrorState extends GetEventStates {
  late final String error;

  RemoveEventErrorState(this.error);
}
class GetAllOrderAdminLoadingState extends GetEventStates {}

class GetAllOrderAdminSuccessState extends GetEventStates {}

class GetAllOrderAdminErrorState extends GetEventStates {
  late final String error;

  GetAllOrderAdminErrorState(this.error);
}


class PostImagePickedSuccessState extends GetEventStates {}

class PostImagePickedErrorState extends GetEventStates {


}



class RemovePostImageSuccessState extends GetEventStates {}