
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../../models/user.dart';

class Grafica extends StatelessWidget {

  final User user;

  Grafica({super.key, required this.user});

  Graph graph = Graph();

  cargarGrafica(){
    Node u = Node.Id(user);
    for (var item in user.getRelations) {
      graph.addEdge(u, Node.Id(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late Algorithm builder;
    cargarGrafica();

    builder = FruchtermanReingoldAlgorithm(iterations: 1000);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              transformationController: TransformationController(),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Center(
                  child: GraphView(
                    graph: graph,
                    algorithm: builder,
                    paint: Paint()..color = Colors.green..strokeWidth = 1..style = PaintingStyle.fill,
                    builder: (node) {
                      return rectangWidget(node.key!.value);
                    }
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget rectangWidget(User user) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: (){},
          child: Tooltip(
            message: '${user.name}',
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber
              ),
              child: Center(child: Text('${user.name}'.toString().substring(0,1)))
            ),
          ),
        );
      }
    );
  }



}