import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../repository/consulta_repository.dart';

class ConsultaController extends GetxController {

  TextEditingController txtBuscar = TextEditingController();

  final user = User().obs;

  Future buscar()async{
    dynamic response = await ConsultaRepository().buscar(txtBuscar.text);
    print(response);
    user.value = User.fromJson(response);
    print(user.value.toString());
  }
}

