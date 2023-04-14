abstract class GetMyEventStates {}

class GetMyEventInitialState extends GetMyEventStates {}

class GetMyEventOrPlaceLoadingState extends GetMyEventStates {}

class GetMyEventOrPlaceSuccessState extends GetMyEventStates {}

class GetMyEventOrPlaceErrorState extends GetMyEventStates {
  late final String error;

  GetMyEventOrPlaceErrorState(this.error);
}

class GetAllOrderLoadingState extends GetMyEventStates {}

class GetAllOrderSuccessState extends GetMyEventStates {}

class GetAllOrderErrorState extends GetMyEventStates {
  late final String error;

  GetAllOrderErrorState(this.error);
}

class GetAllCommentsLoadingState extends GetMyEventStates {}

class GetAllCommentsSuccessState extends GetMyEventStates {}

class GetAllCommentsErrorState extends GetMyEventStates {
  late final String error;

  GetAllCommentsErrorState(this.error);
}

