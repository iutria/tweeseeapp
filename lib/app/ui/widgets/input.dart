
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inputs extends StatelessWidget {
  final bool? icon;
  final String? titulo;
  final TextEditingController? controller;
  final accion;
  Inputs({
    this.icon = false,
    required this.titulo,
    this.accion,
    this.controller
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: null,
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: icon! ? IconButton( onPressed: ()=> Get.back() ,icon: const Icon(Icons.arrow_back,color: Colors.black)) : null,
          suffixIcon: accion==null ? null : IconButton(onPressed: accion,icon: const Icon(Icons.search,color: Colors.black,)),
          hintStyle: const TextStyle(color: Colors.black),
          hintText: titulo,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff6204BF), width: 2),
          ),
        ),
      ),
    );
  }
  
}
