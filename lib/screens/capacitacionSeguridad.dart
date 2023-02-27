import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/Screens/body.dart';

import '../widget/diapostivas_seguridad.dart';

class CapacitacionSeguridad extends StatelessWidget {
  const CapacitacionSeguridad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Portal de transportista',
      theme: ThemeData(
        primarySwatch:
            generateMaterialColor(color: Color.fromARGB(255, 0, 155, 8)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Portal de transportista'),
          actions: [
            IconButton(
              icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(children: [DiapositivasSeguridad()]),
      ),
    );
  }
}
