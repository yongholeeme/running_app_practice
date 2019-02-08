import 'package:rxdart/rxdart.dart';

class TabBloc {

  final _tab = BehaviorSubject<int>();
  Observable<int> get tab => _tab.stream;

  TabBloc() {
    _tab.add(3); // 메인페이지 => 러닝화면
  }

  void changeTab(int index) {
    _tab.add(index);
  }
}