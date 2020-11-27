import 'package:flutter/material.dart';
import 'package:listaApiFlutter/Model/User.dart';

class ListaUsuarios extends ChangeNotifier {
  List aUsuarios = [];

  void guardarLista(User user) {
    //print(user.name);
    aUsuarios.add(user);
    notifyListeners();
    //print("----------- GUARDADO --------------");
  }

  notifyListeners();
}
