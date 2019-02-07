class UserModel2 {
  final String _uid;
  final String _photoUrl;
  final String _email;
  final String _displayName;

  UserModel2(this._uid, this._photoUrl,
    this._email, this._displayName){
  }

  String get uid => _uid;
  String get photoUrl => _photoUrl;
  String get email => _email;
  String get displayName => _displayName;
}