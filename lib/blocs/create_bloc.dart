import 'package:rxdart/rxdart.dart';
import 'package:xlo/models/ad.dart';

enum CreateState { IDLE, LOADING, DONE }

class CreateBloc {
  final BehaviorSubject<CreateState> _stateController =
      BehaviorSubject<CreateState>.seeded(CreateState.IDLE);

  Stream<CreateState> get outState => _stateController.stream;

  saveAd(Ad ad) async {
    _stateController.add(CreateState.LOADING);

    //mandar o ad para o repositorio

    await Future.delayed(Duration(seconds: 3));
  }

  void dispose() {
    _stateController.close();
  }
}
