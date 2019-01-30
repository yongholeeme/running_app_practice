import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../repository/running_repository.dart';

import 'package:running_app_practice/src/model/running_model.dart';

class RunningBloc {
  final _runningRepository = RunningRepository();

  final _duration = BehaviorSubject<String>();
  final _distance = BehaviorSubject<String>();
  final _average = BehaviorSubject<String>();
  
  final Stopwatch stopWatch = new Stopwatch();
  final timerMillisecondsRefreshRate = 30;
  Timer timer;

  Observable<String> get duration => _duration.stream;
  Observable<String> get distance => _distance.stream;
  Observable<String> get average => _average.stream;

  RunningBloc();

  void uploadRunningModel(RunningModel runningModel) {
    _runningRepository.uploadRunning(runningModel);
  }

  // start timer right after entering doing running screen.
  void start() {
    stopWatch.start();
    timer = new Timer.periodic(new Duration(milliseconds: timerMillisecondsRefreshRate), callback);
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
  }
  void callback(Timer timer) {
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
  }
  // resume timer
  void resume() {
    stopWatch.start();
  }
  // stop timer
  void pause() {
    stopWatch.stop();
  }
  void stop() {
    stopWatch.stop();
    stopWatch.reset();
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
  }

  String calculateTime(time) {
    var timeList = time.split(":");
    String hours = timeList[0];
    String mins = timeList[1];
    String secs = timeList[2];
    if (hours == "0") {
      return (mins + ":" + secs.substring(0,2));
    }
    else {
      return (hours + ":" + mins + ":" + secs.substring(0,2));
    }
  }

  void dispose() async {
    await _duration.drain();
    _duration.close();
    await _distance.drain();
    _distance.close();
    await _duration.drain();
    _average.close();
  }
}
