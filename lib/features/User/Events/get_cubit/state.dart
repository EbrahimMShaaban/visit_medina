abstract class GetAllEventStates {}

class GetAllEventInitialState extends GetAllEventStates {}

class GetAllEventOrPlaceLoadingState extends GetAllEventStates {}

class GetAllEventOrPlaceSuccessState extends GetAllEventStates {}

class GetAllEventOrPlaceErrorState extends GetAllEventStates {
  late final String error;

  GetAllEventOrPlaceErrorState(this.error);
}

class ReservationLoadingState extends GetAllEventStates {}

class ReservationSuccessState extends GetAllEventStates {}

class ReservationErrorState extends GetAllEventStates {
  late final String error;

  ReservationErrorState(this.error);
}

class RatingLoadingState extends GetAllEventStates {}

class RatingSuccessState extends GetAllEventStates {}

class RatingErrorState extends GetAllEventStates {
  late final String error;

  RatingErrorState(this.error);
}

