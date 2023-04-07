import 'package:visit_medina/models/user_model.dart';

abstract class GetUserStates {}

class GetUserInitialState extends GetUserStates {}

class GetUserLoadingState extends GetUserStates {}

class GetUserSuccessState extends GetUserStates {
  final UserModel? userModel;

  GetUserSuccessState(this.userModel);
}

class GetUserErrorState extends GetUserStates {
  late final String error;

  GetUserErrorState(this.error);
}
