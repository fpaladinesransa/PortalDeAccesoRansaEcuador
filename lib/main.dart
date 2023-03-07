import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portaltransportistas/screens/IngresoData.dart';
import 'package:portaltransportistas/screens/bodyConsulta.dart';
import 'package:portaltransportistas/screens/capacitacionSeguridad.dart';
import 'package:portaltransportistas/screens/evaluacion.dart';
import 'package:portaltransportistas/screens/gracias.dart';
import 'Screens/body.dart';
import 'api/ieespost.dart';

void main() => runApp(MyAppMain());

// ignore: use_key_in_widget_constructors
class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ingresodata",
      initialRoute: "/",
      routes: {
        '/': (_) => MyApp(asegurados: obtenerSeguros()),
        '/ingresodata': (_) => IngresoDataPersonal(),
        '/evaluaciondata': (_) => EvaluacionDataPersonal(
              cedula: '',
            ),
        '/CapacitacionSeguridad': (_) => CapacitacionSeguridad(
              cedula: '',
            ),
        '/Gracias': (_) => GraciasPantalla(
              cedula: '0922002175',
              puntuacion: '6',
              resultado: 'denegado',
            ),
      },
    );
  }
}
