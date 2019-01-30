import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/running_model.dart';
import '../bloc/auth_bloc_provider.dart';

class RunningApi {
  Firestore _firestore = Firestore.instance;
  AuthBloc _authBloc;

  // C : upload RunningModel to Firestore
  void uploadRunning(RunningModel runningModel) {
    _firestore.collection('users').document(_authBloc.getUid())
      .collection('running').document(runningModel.runningDate)
      .setData({
        'runningDate' : runningModel.runningDate,
        'distance' : runningModel.distance,
        'duration' : runningModel.duration,
        'average' : runningModel.average,
      });
  }

  // R : read RunningModels from Firestore
  Future<List<RunningModel>> readRunningModels() {
    // List<RunningModel> result;
    // return ;
  }
  // D : delete RunningModel from Firestore
  // TODO: 비동기 처리;
  Future<void> deleteRunningModel(RunningModel runningModel) {
    _firestore.collection('users').document(_authBloc.getUid())
      .collection('running').document(runningModel.runningDate).delete();
  }
  // U : update RunningModel from Firestore

}