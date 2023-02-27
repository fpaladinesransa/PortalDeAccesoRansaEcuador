import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/api/ieespost.dart';
import 'package:portaltransportistas/screens/bodyConsulta.dart';
import 'package:portaltransportistas/screens/tabla.dart';

class MyApp extends StatelessWidget {
  final Future<List<ProjectList>> asegurados;

  const MyApp({Key? key, required this.asegurados}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var query = "";

    Future<List<ProjectList>> dataLista = obtenerSeguros(query: query);
    TextEditingController _textoController = TextEditingController(text: "");

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
        body: Stack(
          children: [
            Card(
              child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                      controller: _textoController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MyAppConsulta(_textoController.text))));
                      },
                      decoration: InputDecoration(
                          hintText: 'Buscar por numero de cedula',
                          border: InputBorder.none),
                      onChanged: (value) {}),
                  trailing: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MyAppConsulta(_textoController.text))));
                      })),
            ),
            Center(
              child: FutureBuilder<List<ProjectList>>(
                future: dataLista,
                builder: (context, snapshot) {
                  var filterData = snapshot.data;

                  if (snapshot.hasData) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
//
//
//------Tabla----------------------------------
//
//

                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: tablaBody(filterData)),
                        )
                      ],
                    );
/*                 return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(snapshot.data![index].cedula));
                          }); */
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // Por defecto, muestra un loading spinner
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
