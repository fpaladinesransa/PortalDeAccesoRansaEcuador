import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_mostrarActaEntrega.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../pages/gh_renovar.dart';
import '../pages/gh_solicitudEPP.dart';
import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';

Future<void> mostrarDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Consumer<DropdownService>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(""),
                Text(
                    'Estas seguro/a de registrar este usuario, se le asignara los siguientes recursos:'),
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
        }),
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
  final datainventario = Provider.of<DropdownService>(context, listen: false);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Consumer<VariablesExt>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(""),
                Text(
                    'Estas seguro/a de registrar ${value.nombres}, se le asignara los siguientes recursos:'),
                Text("${value.epp}"),
              ],
            ),
          );
        }),
        actions: <Widget>[
          TextButton(
            child: const Text('Rechazar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Consumer<VariablesExt>(builder: (context, value, child) {
            return TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                enviadoCorrectamente(
                    context, "Registro EPP exitoso", GhRenovarequipo());
                //Actualizar registro
                datainventario.renovarSelect == 'Asignar de inventario'
                    ? {
                        enviadoCorrectamente(
                            context, "REGISTRO EPP", GhRenovarequipo())
/*                   enviarRenovacion(value.epp,"vigente",value.cedula,value.fechaCompra,value.fechaEntrega,value.id),
                  enviarRenovacionBaja("Baja",DateFormat('yMd').format(now),value.idInic),
                  print("Asignar de inventario") */
                      }
                    : {
                        enviadoCorrectamente(
                            context, "REGISTRO EPP", GhRenovarequipo())

                        //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
                      };

                Navigator.of(context).pop();
              },
            );
          }),
        ],
      );
    },
  );
}

Future<void> mostrarDialogoPendienteEntrega(context, nombre, apellido, cedula,
    fechacompra, fechaEntrega, epp, estado, motivo, comentarios, id) async {
  final now = new DateTime.now();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(""),
              Text(
                  'Estas seguro/a de aprobar la solicitud de renovación de  ${nombre} ${apellido},'),
              Text(""),
              Text("Por motivos de: ${comentarios}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              insertGHsolicitud(epp, cedula, motivo, fechaEntrega.toString(),
                  comentarios, "aprobado", id.toString());
              actualizarGHsolicitud("", "Renovar", "", id.toString());
              enviadoCorrectamente(
                  context, "Solicitud EPP exitosa", GhSolicitudEPPState());

              //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> mostrarDialogoPendienteEntregaRechazo(
    context,
    nombre,
    apellido,
    cedula,
    fechacompra,
    fechaEntrega,
    epp,
    estado,
    motivo,
    comentarios,
    id) async {
  final now = new DateTime.now();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(""),
              Text(
                  'Estas seguro/a de rechazar la solicitud de renovación de  ${nombre} ${apellido},'),
              Text(""),
              Text("Por motivos de: ${comentarios}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              insertGHsolicitud(epp, cedula, motivo, fechaEntrega.toString(),
                  comentarios, "rechazado", id.toString());
              actualizarGHsolicitud("", estado, "", id.toString());
              enviadoCorrectamente(context, "Solicitud Rechazada con exito",
                  GhSolicitudEPPState());

              //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> enviadoCorrectamente(context, titulo, pagina) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text(
          titulo,
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Consumer<VariablesExt>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => pagina,
                        ),
                      );
                    },
                    child: Lottie.asset('assets/Aceptar.json',
                        repeat: false,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover)),
              ],
            ),
          );
        }),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Aceptar',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pagina,
                ),
              );
              //Actualizar registro
            },
          )
        ],
      );
    },
  );
}

Future<void> mostrarDocumentoActEntrega(
    context, nombre, apellido, numero, epp, cedula, firma) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE

        content:
            GhMostrarActEntrega(nombre, apellido, numero, epp, cedula, firma),
        actions: <Widget>[
          TextButton(
            child: const Text('Descargar'),
            onPressed: () {},
          ),
          TextButton(
            child: const Text('Volver'),
            onPressed: () {
              Navigator.of(context).pop();
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> colFirmaDocumentoActEntrega(
    context, nombre, apellido, numero, epp, cedula, firma, id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        content:
            GhMostrarActEntrega(nombre, apellido, numero, epp, cedula, firma),
        actions: <Widget>[
          if (firma == "")
            TextButton(
              child: const Text(
                'Firmar',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showSecond(context, nombre, apellido, numero, epp, cedula, id);
              },
            ),
          if (firma != "")
            TextButton(
              child: const Text(
                'Enviar',
                style: TextStyle(fontSize: 20),
              ),
              //Actualizar la informacion a SQL
              onPressed: () {
                colactualizarFirma("Si", "vigente", id.toString());
                insertActadeEntregaEpp(id.toString(), nombre, apellido, cedula,
                    firma, "ingresado", epp, numero);
                enviadoCorrectamente(
                    context, "Epp firmado con exito", ColHome());
              },
            ),
          TextButton(
            child: const Text(
              'Volver',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future showSecond(
    BuildContext context, nombre, apellido, numero, epp, cedula, id) {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Firmar"),
      content: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1.0,
              maximumStrokeWidth: 4.0)),
      actions: [
        TextButton(
          onPressed: () async {
            final data =
                await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
            final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
            final base64String = base64Encode(bytes!.buffer.asUint8List());
            colFirmaDocumentoActEntrega(context, nombre, apellido, numero, epp,
                cedula, base64String, id);
          },
          child: const Text('Firmar'),
        ),
      ],
    ),
  );
}
