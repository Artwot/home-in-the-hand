//Modelo con la BD que contendrá los datos para Firebase.

import 'package:firebase_database/firebase_database.dart';

class Usuario {
  //Datos de la BD:
  String id;
  String nombre;
  String apellido;
  String email;

  Usuario(this.id, this.nombre, this.apellido, this.email);

  //Mapeo para estructurar los datos:
  Usuario.map(dynamic obj) {
    this.nombre = obj['nombre'];
    this.apellido = obj['apellido'];
    this.email = obj['email'];
  }

  //Getters de las variables.
  String get getID => id;
  String get getNombre => nombre;
  String get getApe => apellido;
  String get getEmail => email;

  //Para crear una tabla en Firebase:
  Usuario.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    apellido = snapshot.value['apellido'];
    email = snapshot.value['email'];
  }
}
