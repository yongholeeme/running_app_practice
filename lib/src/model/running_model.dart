import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';

class RunningModel {
  final String duration;
  final String distance;
  final String average;
  final String runningDate;
  final DateTime runningDateeee;
  // final List<Position> positions;

  // RunningModel(this.duration, this.distance, this.average, this.runningDate, this.runningDateeee, this.positions);
  RunningModel(this.duration, this.distance, this.average, this.runningDate, this.runningDateeee);
}
