class UserModel {
  final String id;
  final String nombre;
  final String correo;
  final String rol;
  final String telefono;
  final String codigo;

  const UserModel({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.rol,
    required this.telefono,
    required this.codigo,
  });

  UserModel copyWith({
    String? id,
    String? nombre,
    String? correo,
    String? rol,
    String? telefono,
    String? codigo,
  }) {
    return UserModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      rol: rol ?? this.rol,
      telefono: telefono ?? this.telefono,
      codigo: codigo ?? this.codigo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'rol': rol,
      'telefono': telefono,
      'codigo': codigo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      nombre: map['nombre'] ?? '',
      correo: map['correo'] ?? '',
      rol: map['rol'] ?? '',
      telefono: map['telefono'] ?? '',
      codigo: map['codigo'] ?? '',
    );
  }
}
