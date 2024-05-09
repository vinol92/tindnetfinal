// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String nombre;
  String apellidos;
  String telefono;
  String email;
  String contrasena;
  String categoria;
  String localidad;
  String codicop;
  String edad;
  List<dynamic> fotosPerfil;

  Usuario({
    required this.nombre,
    required this.apellidos,
    required this.telefono,
    required this.email,
    required this.contrasena,
    required this.localidad,
    required this.codicop,
    required this.categoria,
    required this.edad,
    required this.fotosPerfil,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        email: json["email"],
        contrasena: json["contrasena"],
        localidad: json["localidad"],
        categoria: json["categoria"],
        codicop: json["codicop"],
        edad: json["edad"],
        fotosPerfil: List<dynamic>.from(json["fotosPerfil"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "email": email,
        "categoria": categoria,
        "contrasena": contrasena,
        "localidad": localidad,
        "codicop": codicop,
        "edad": edad,
        "fotosPerfil": List<dynamic>.from(fotosPerfil.map((x) => x)),
      };
}
