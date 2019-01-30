import 'package:cloud_firestore/cloud_firestore.dart';

class RunningModel {
  final String duration;
  final String distance;
  final String average;
  final String runningDate;
  // final List<any> 
  // geo and time

  RunningModel(this.duration, this.distance, this.average, this.runningDate);
}