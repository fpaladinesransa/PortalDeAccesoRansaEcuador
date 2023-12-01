import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class GH_AlmacenarInventario extends StatefulWidget {
  const GH_AlmacenarInventario({super.key});

  @override
  State<GH_AlmacenarInventario> createState() => _GH_AlmacenarInventarioState();
}

class _GH_AlmacenarInventarioState extends State<GH_AlmacenarInventario> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          Container(
            width: ancho * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                ImagenRansaTop(ancho: ancho),
                SeparadorTitulo(titulo: "Inventarios de todos los Epp Activos"),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
