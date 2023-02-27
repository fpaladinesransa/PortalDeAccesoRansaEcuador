import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/Screens/body.dart';

class GraciasPantalla extends StatelessWidget {
  const GraciasPantalla({super.key});

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
            body: Container()));
  }
}
