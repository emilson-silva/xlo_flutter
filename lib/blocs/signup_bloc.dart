import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/user.dart';

enum SignUpState { IDLE, LOADING, ERROR }

class SignUpBloState {
  SignUpBloState(this.state, {this.errorMessage});

  SignUpState state;
  String errorMessage;
}

class SignUpBloc {
  final BehaviorSubject<SignUpBloState> _stateController =
      BehaviorSubject<SignUpBloState>.seeded(SignUpBloState(SignUpState.IDLE));

  Stream<SignUpBloState> get outState => _stateController.stream;

  User user = User();

  set name(String name) => user.name = name;

  void dispose() {
    _stateController.close();
  }
}
