import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweesee/app/controllers/consulta_controller.dart';

import 'package:tweesee/app/ui/pages/results.dart';
import 'package:tweesee/app/ui/widgets/input.dart';

import '../../constantes.dart';

class HomePage extends GetView {

  ConsultaController consulta = Get.put(ConsultaController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Twee See',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50
                ),
              ),
              const SizedBox(height: 20,),
              Inputs(
                titulo: 'Buscar en twitter',
                controller: consulta.txtBuscar,
              ),
              const SizedBox(height: 20,),
              BotonHoverFocus(
                accion: (){
                  if(consulta.txtBuscar.text.isEmpty){
                    Get.snackbar(
                      'Error', 
                      'Debe ingresar el texto de la busqueda', 
                      snackPosition: SnackPosition.BOTTOM, 
                      margin: const EdgeInsets.all(20), 
                      backgroundColor: colorPrincipal,
                      colorText: Colors.white
                    );
                    return;
                  }
                  consulta.buscar();
                  Get.to(ResultsPage(busqueda: consulta.txtBuscar.text));
                  // consulta.buscar('iutria97');
                },
              )
            ],
          )
        ),
      )
    );
  }
}

class BotonHoverFocus extends StatelessWidget {
  
  final _onHovered = false.obs;
  final _onFocused = false.obs;
  final Function() accion;
  BotonHoverFocus({
    Key? key,
    required this.accion,
  }) : super(key: key);

  hover(value){
    _onHovered.value = !_onHovered.value;
  }

  focus(value){
    _onFocused.value = !_onFocused.value;
  } 

  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        return GestureDetector(
          onTap: accion,
          child: FocusableActionDetector(
            onShowFocusHighlight: focus,
            onShowHoverHighlight: hover,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: _onHovered.value || _onFocused.value ? Colors.red:const Color(0xff6204BF),
                  borderRadius: BorderRadius.circular(5)
                ),
                height: 50,
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Buscar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
