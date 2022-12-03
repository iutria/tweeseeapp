import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphview/GraphView.dart' as grafica;
import 'package:tweesee/app/controllers/consulta_controller.dart';
import 'package:tweesee/app/ui/pages/grafica.dart';

import '../../models/user.dart';
import '../widgets/input.dart';

class ResultsPage extends GetView {

  final String busqueda;
  ConsultaController consulta = Get.find();

  ResultsPage({super.key, required this.busqueda});
  
  List items = [
    {
      'texto': 'Usuarios',
      'child': UserResults()
    },
    // {
    //   'texto': 'Publicaciones',
    //   'child': Text('asssssd',)
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          title: Inputs(
            icon: true,
            titulo: 'Buscar en twitter',
            controller: consulta.txtBuscar,
            accion: (){
              consulta.buscar();
            },
          ),
          // bottom: TabBar(
          //   tabs: items.map((e) => Text(e['texto'])).toList(),
          //   indicator: const UnderlineTabIndicator(
          //     borderSide: BorderSide(
          //       width: 3, 
          //       color: Color(0xff6204BF),
          //     )
          //   ),
          // ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: UserResults()
        // body: TabBarView(
        //   children: items.map((e) => Tab(child: e['child'],)).toList(),
        // )
      ),
    );
  }
}

class UserResults extends StatelessWidget {
  
  ConsultaController consulta = Get.find();
  
  UserResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){return ListView(
      children: [
        const SizedBox(height: 20,),
        consulta.user.value.id==null ?Container(): ListTile(
          title: Text(consulta.user.value.name),
          subtitle: Text(consulta.user.value.username),
          tileColor: Colors.grey,
          onTap: ()=>Get.to(DetailsUserPage(user: consulta.user.value,)),
        )
      ],
    );});
  }
}


class DetailsUserPage extends GetView{

  final User user;

  DetailsUserPage({ required this.user });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){print(user.getRelations);}, icon: Icon(Icons.add))
        ],
      ),
      body: Grafica(user: user,)
    );
  }
}

