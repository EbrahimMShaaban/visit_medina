abstract class GetAllEventStates {}

class GetAllEventInitialState extends GetAllEventStates {}

class GetAllEventOrPlaceLoadingState extends GetAllEventStates {}
class GetfavouritLoadingState extends GetAllEventStates {}

class GetAllEventOrPlaceSuccessState extends GetAllEventStates {}

class GetAllEventOrPlaceErrorState extends GetAllEventStates {
  late final String error;

  GetAllEventOrPlaceErrorState(this.error);
}

class GetAllFavoriteLoadingState extends GetAllEventStates {}

class GetAllFavoriteSuccessState extends GetAllEventStates {}

class GetAllFavoriteErrorState extends GetAllEventStates {
  late final String error;

  GetAllFavoriteErrorState(this.error);
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

class FavouriteLoadingState extends GetAllEventStates {}

class FavouriteSuccessState extends GetAllEventStates {}

class FavouriteErrorState extends GetAllEventStates {
  late final String error;

  FavouriteErrorState(this.error);
}
class GetAllOrderUserLoadingState extends GetAllEventStates {}

class GetAllOrderUserSuccessState extends GetAllEventStates {}

class GetAllOrderUserErrorState extends GetAllEventStates {
  late final String error;

  GetAllOrderUserErrorState(this.error);
}

