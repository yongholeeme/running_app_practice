import '../api/running_api.dart';
import '..//model/running_model.dart';

class RunningRepository {
  final _runningApi = RunningApi();

  void uploadRunning(runningModel) =>
    _runningApi.uploadRunning(runningModel);

  void deleteRunning(runningModel) =>
    _runningApi.deleteRunningModel(runningModel);
}