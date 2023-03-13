import 'package:flutter/material.dart';

import '../widget/diapostivas_seguridad.dart';

class CapacitacionSeguridad extends StatelessWidget {
  const CapacitacionSeguridad({super.key, required this.cedula});
  final String cedula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inducción de seguridad Ransa $cedula'),
        actions: [
          IconButton(
            icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        DiapositivasSeguridad(
          cedula: cedula,
        )
      ]),
    );
  }
}
