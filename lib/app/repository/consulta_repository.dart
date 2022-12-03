
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:tweesee/app/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class ConsultaRepository{

//   Future buscar(busqueda)async{
//     var dio = Dio();
//     return await dio.get('$urlApi/buscar/$busqueda');
//   }
//   // Future<Response> buscar(String busqueda) async => get('https://jsonplaceholder.typicode.com/posts');
//   // Future<Response> buscar(String busqueda) => get('$urlApi/buscar/$busqueda');

// }
class ConsultaRepository{
  Future buscar(busqueda) async {
    final response = await http.get(Uri.parse('$urlApi/buscar/$busqueda'));
    return json.decode(response.body);
  }
}