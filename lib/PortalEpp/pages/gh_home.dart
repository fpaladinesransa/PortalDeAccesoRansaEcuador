import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class Gh_home extends StatefulWidget {
  const Gh_home({super.key});

  @override
  State<Gh_home> createState() => _Gh_homeState();
}

class _Gh_homeState extends State<Gh_home> {
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
                SeparadorTitulo(titulo: "Menu"),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                  ],
                ),
                Container(
                  height: alto * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                  ],
                ),
                Container(
                  height: alto * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                    CustomButtonMenu(
                      icon: Icons.mode_edit,
                      onPressed: () {
                        // Handle button press action
                      },
                      buttonText: 'Firmas pendientes',
                    ),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
