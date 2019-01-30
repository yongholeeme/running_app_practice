import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/user_api.dart';

class UserRepository {
  final _userApi = UserApi();

  Future<int> authenticateUser(String email, String password) =>
    _userApi.authenticateUser(email, password);

  Future<void> registerUser(String email, String password) =>
    _userApi.registerUser(email, password);
}