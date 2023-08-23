
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';

import '../provider/gh_registerNew.dart';



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