import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/bloc/gh_bloc.dart';

import 'package:portaltransportistas/routes/router.dart';

import 'package:portaltransportistas/services/navigation_service.dart';
import 'PortalEpp/pages/gh_home.dart';
import 'Screens/portal_estado.dart';

import 'locator.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(MyAppMain());
}
/* class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<GhBloc>(
          create: (context) => GhBloc(),
        ),
      ],
      child: MyAppMain(),
    );
  }
}
 */


// ignore: use_key_in_widget_constructors
class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,

      title: 'Ransa',
      theme: ThemeData(
          primarySwatch:
              generateMaterialColor(color: Color.fromARGB(255, 0, 155, 8))),
      initialRoute: "/ghhome",
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
/*       builder: ((context, child) {
        return MyApp(asegurados: obtenerSegurosTotales());
      }),
 */
/*       routes: {
        '/home': (_) => MyApp(asegurados: obtenerSegurosTotales()),
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
      }, */
    );
  }
}
