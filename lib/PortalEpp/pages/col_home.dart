import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
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
    return Scaffold(
      body: Row(
        children: [
          const Col_menu(),
          SingleChildScrollView(
            child: Column(
              children: [
                SeparadorTitulo(
                  titulo: 'Firmas pendientes de realizar',
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      height: 400,
                      width: 1075,
                      child: FutureBuilder<List<TablasColFaltaFirmaSel>>(
                          future: dataLista,
                          builder: (context, snapshot) {
                            var filterData = snapshot.data;
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                children: <Widget>[
                                  Expanded(
                                    child: TablaColSinFirma(
                                      data: filterData,
                                    ),
                                  )
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
