import 'package:rxdart/rxdart.dart';

enum SignUpState { IDLE, LOADING, ERROR }

class SignUpBloc {
  final BehaviorSubject _stateController = BehaviorSubject();

  void dispose() {
    _stateController.close();
  }
}
