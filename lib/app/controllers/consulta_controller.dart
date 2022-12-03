import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../repository/consulta_repository.dart';

class ConsultaController extends GetxController {

  TextEditingController txtBuscar = TextEditingController();

  final user = User().obs;

  Future buscar()async{
    user.value = User();
    dynamic response = await ConsultaRepository().buscar(txtBuscar.text.trim());
    user.value = User.fromJson(response);
  }
}

