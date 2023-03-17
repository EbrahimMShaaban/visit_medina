abstract class AppState {}
class InitialState extends AppState {}
class ChangeNavBottomState extends AppState {}
class LoadingState extends AppState {}
class SuccessState extends AppState {}
class ErrorState extends AppState {
  final String errorMsg;
  ErrorState(this.errorMsg);
}
