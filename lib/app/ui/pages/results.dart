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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Inputs(
          icon: true,
          titulo: 'Buscar en twitter',
          controller: consulta.txtBuscar,
          accion: (){
            consulta.buscar();
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      // body: Obx(() => consulta.user == null ? CircularProgressIndicator() : UserResults(),)
      body: UserResults(),
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
        consulta.user.value.id==null ?Center(child: CircularProgressIndicator()): ListTile(
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

  const DetailsUserPage({super.key,  required this.user });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name),
              Text(user.username, style: TextStyle(fontSize: 10),),
            ],
          ),
          centerTitle: false,
          bottom: const  TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Seguidores'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Seguidos'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text('Grafica'),
              ),
            ],
            indicator:  UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3, 
                color: Color(0xff6204BF),
              )
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            followers(user: user),
            followings(user: user),
            Grafica(user: user)
          ],
        )
      ),
    );
  }
}


class followers extends StatelessWidget {

  final User user;
  const followers({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        user.followers.length, 
        (index) => ListTile(
            title: Text('${user.followers['$index']['name']}'),
            subtitle: Text('${user.followers['$index']['username']}'),
        )),
    );
  }
}
class followings extends StatelessWidget {
  final User user;
  const followings({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        user.followings.length, 
        (index) => ListTile(
            title: Text('${user.followings['$index']['name']}'),
            subtitle: Text('${user.followings['$index']['username']}'),
        )),
    );
  }
}
