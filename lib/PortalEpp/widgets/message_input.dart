
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';



Future<void> mostrarDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog( // <-- SEE HERE
        title: const Text('REGISTRO EPP', 
        style: TextStyle(
          color: Color( 0xff009B3A ),
          fontSize: 30

        ),),
        content: Consumer<DropdownService>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  Text(""),
                  Text('Estas seguro/a de registrar este usuario, se le asignara los siguientes recursos:'),
                  if (value.botasselected == "Si")
                  Text("${value.botasCantidad} Botas"),
                  if (value.cascoselected == "Si")
                  Text("${value.cascosCantidad} Casco"),
                  if (value.camisetasselected == "Si")
                  Text("${value.camisetasCantidad} Camisetas"),
                  if (value.camisasselected == "Si")
                  Text("${value.camisasCantidad} Camisas"),
                  if (value.chalecoselected == "Si")
                  Text("${value.chalecosCantidad} Chalecos")
                ],
              ),
            );
          }
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Rechazar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



Future<void> mostrarDialogRenovar(context) async {
   final now = new DateTime.now();
  
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog( // <-- SEE HERE
        title: const Text('REGISTRO EPP', 
        style: TextStyle(
          color: Color( 0xff009B3A ),
          fontSize: 30

        ),),
        content: Consumer<VariablesExt>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  Text(""),
                  Text('Estas seguro/a de registrar ${value.nombres}, se le asignara los siguientes recursos:'),
                  Text("${value.epp}"),

                ],
              ),
            );
          }
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Rechazar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Consumer<VariablesExt>(
            builder: (context, value, child) {
              return TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  //Actualizar registro

                  enviarRenovacionBaja("Vigente",DateFormat('yMd').format(now),value.idInic);
                  enviarRenovacion(value.epp,"Activo",value.cedula,value.fechaCompra,value.fechaEntrega,value.id);


                  //Insertar nuevos registros
                  insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar);




                  Navigator.of(context).pop();
                },
              );
            }
          ),
        ],
      );
    },
  );
}