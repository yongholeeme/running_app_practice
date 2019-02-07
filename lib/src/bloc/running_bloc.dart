import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:geolocator/geolocator.dart';

import '../repository/running_repository.dart';

import '../model/running_model.dart';
import 'package:geolocator/geolocator.dart';

class RunningBloc {
  final _runningRepository = RunningRepository();

  final _duration = BehaviorSubject<String>();
  final _distance = BehaviorSubject<String>();
  final _average = BehaviorSubject<String>();
  
  final Stopwatch stopWatch = new Stopwatch();
  final timerMillisecondsRefreshRate = 1000;
  Timer timer;

  var position2 = BehaviorSubject<Position>();
  Observable<Position> get position => position2.stream;
  Position tempPosition;
  RunningModel runningModel;

  Observable<String> get duration => _duration.stream;
  Observable<String> get distance => _distance.stream;
  Observable<String> get average => _average.stream;

  // GPS
  Position nowPosition;

  StreamSubscription<Position> positionStream;
  Position prePosition;
  List<Position> positions;
  double sumDistance = 0.0;

  Stream<Position> $position = Geolocator().getPositionStream(LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1));
  void gpsStart() {
    positionStream = new Geolocator().getPositionStream().listen(
      (Position position) => nowPosition = position
    );
  }

  // Constructor
  RunningBloc(){
  }

  void uploadRunningModel(RunningModel runningModel) {
    _runningRepository.uploadRunning(runningModel);
  }

  // start timer right after entering doing running screen.
  void start() async {
    stopWatch.start();
    Geolocator().getCurrentPosition().then((data) {prePosition = data;});
    gpsStart();
    timer = new Timer.periodic(new Duration(milliseconds: timerMillisecondsRefreshRate), callback);
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
  }

  void callback (Timer timer) async {
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
    print("와옹...");
    print("와옹12...");
    double distanceInMeters;
    print("pre: " + prePosition.toString());
    print("now: " + nowPosition.toString());
    await Geolocator().distanceBetween(prePosition.latitude, prePosition.longitude, nowPosition.latitude, nowPosition.longitude).then(
      (data) {
        print("distanceInMeters" + data.toString());
        // _distance.add("100");
        sumDistance = sumDistance + data;
        prePosition = nowPosition;

        _distance.add(sumDistance.toString());
      }
    );
    
  }

  // resume timer
  void resume() {
    stopWatch.start();
  }

  // pause timer
  void pause() {
    stopWatch.stop();
  }

  // stop & upload timer
  void stop() {
    // runningModel = new RunningModel(duration, distance, average, runningDate, runningDateeee, positions)
    stopWatch.stop();
    timer.cancel();
    stopWatch.reset();
    _duration.add(calculateTime(stopWatch.elapsed.toString()));
  }

  String calculateTime(time) {
    var timeList = time.split(":");
    String hours = timeList[0];
    String mins = timeList[1];
    String secs = timeList[2];
    if (hours == "0")
      return (mins + ":" + secs.substring(0,2));
    else
      return (hours + ":" + mins + ":" + secs.substring(0,2));
  }

  void change() async {
    tempPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position2.add(tempPosition);
  }
  void changeStart() async {
    tempPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    position2.add(tempPosition);
  }

  // release
  void dispose() async {
    await _duration.drain();
    _duration.close();
    await _distance.drain();
    _distance.close();
    await _duration.drain();
    _average.close();
    positionStream.cancel();
  }
}
