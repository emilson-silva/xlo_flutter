import 'package:rxdart/rxdart.dart';

enum SignUpState { IDLE, LOADING, ERROR }

class SignUpBloState {
  SignUpState state;
  String errorMessage;
}

class SignUpBloc {
  final BehaviorSubject _stateController = BehaviorSubject();

  void dispose() {
    _stateController.close();
  }
}
