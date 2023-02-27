import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portaltransportistas/screens/CapacitacionSeguridad.dart';
import 'package:portaltransportistas/screens/IngresoData.dart';
import 'package:portaltransportistas/screens/bodyConsulta.dart';
import 'package:portaltransportistas/screens/evaluacion.dart';
import 'Screens/body.dart';
import 'api/ieespost.dart';

void main() => runApp(MyAppMain());

// ignore: use_key_in_widget_constructors
class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RutasApp",
      initialRoute: "/evaluaciondata",
      routes: {
        '/': (_) => MyApp(asegurados: obtenerSeguros()),
        '/CapacitacionSeguridad': (_) => CapacitacionSeguridad(),
        '/ingresodata': (_) => IngresoDataPersonal(),
        '/evaluaciondata': (_) => EvaluacionDataPersonal()
      },
    );
  }
}
