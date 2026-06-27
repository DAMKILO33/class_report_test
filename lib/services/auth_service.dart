import '../models/user_model.dart';

class AuthService {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  void login(String id, String name, String email) {
    _currentUser = UserModel(id: id, name: name, email: email);
  }

  void logout() {
    _currentUser = null;
  }
}
