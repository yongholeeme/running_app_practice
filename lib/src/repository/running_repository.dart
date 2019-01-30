import 'package:running_app_practice/src/api/running_api.dart';
import 'package:running_app_practice/src/model/running_model.dart';

class RunningRepository {
  final _runningApi = RunningApi();

  void uploadRunning(RunningModel runningModel) =>
    _runningApi.uploadRunning(runningModel);

  void deleteRunning(RunningModel runningModel) =>
    _runningApi.deleteRunningModel(runningModel);
}