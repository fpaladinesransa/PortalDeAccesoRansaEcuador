import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_col.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class ColHome extends StatefulWidget {
  const ColHome({super.key});

  @override
  State<ColHome> createState() => _ColHomeState();
}

Future<List<TablasColFaltaFirmaSel>> dataLista =
    obtenerTablasColFaltaFirmaSel();

class _ColHomeState extends State<ColHome> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          const Col_menu(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: ancho * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonMenu(
                        icon: Icons.account_box,
                        onPressed: () {
                          // Handle button press action
                        },
                        buttonText: 'Mis EPP',
                      ),
                      CustomButtonMenu(
                        icon: Icons.mode_edit,
                        onPressed: () {
                          // Handle button press action
                        },
                        buttonText: 'Firmas pendientes',
                      ),
                      CustomButtonMenu(
                        icon: Icons.new_releases,
                        onPressed: () {
                          // Handle button press action
                        },
                        buttonText: 'Solicitar EPP',
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
