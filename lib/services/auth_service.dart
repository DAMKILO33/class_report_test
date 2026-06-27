import '../models/user_model.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  final List<UserModel> _users = [
    const UserModel(
      id: '1',
      nombre: 'Administrador',
      correo: 'admin@classreport.com',
      rol: 'Administrador',
      telefono: '999999999',
      codigo: 'ADM001',
    ),
    const UserModel(
      id: '2',
      nombre: 'Luis Hancco',
      correo: 'luis@classreport.com',
      rol: 'Estudiante',
      telefono: '987654321',
      codigo: 'EST001',
    ),
  ];

  bool login({required String correo, required String password}) {
    try {
      final user = _users.firstWhere(
        (u) => u.correo.toLowerCase() == correo.toLowerCase(),
      );

      // Contraseña simulada
      if (password == '123456') {
        _currentUser = user;
        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  bool register({
    required String nombre,
    required String correo,
    required String telefono,
    required String rol,
    required String password,
  }) {
    final existe = _users.any(
      (u) => u.correo.toLowerCase() == correo.toLowerCase(),
    );

    if (existe) {
      return false;
    }

    _users.add(
      UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nombre: nombre,
        correo: correo,
        telefono: telefono,
        rol: rol,
        codigo: 'USR${_users.length + 1}',
      ),
    );

    return true;
  }

  void logout() {
    _currentUser = null;
  }

  bool get isLogged => _currentUser != null;

  List<UserModel> get users => List.unmodifiable(_users);
}
