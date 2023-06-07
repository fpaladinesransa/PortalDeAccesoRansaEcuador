
import 'package:fluro/fluro.dart';

import '../Screens/Portal_Estados.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    router.define("home", handler: _counterHandler);
    router.define('/capacitacion', handler: _counterHandlerCapacitacion);
    router.define('/capacitacionSeguridad',
        handler: _counterHandlerCapacitacionSeguridad);
    router.notFoundHandler = pageNotFound;
  }

  static Handler _counterHandler = Handler(
    handlerFunc: (context, parameters) =>
        MyApp(asegurados: obtenerSegurosTotales()),
  );

  static Handler _counterHandlerCapacitacion = Handler(
    handlerFunc: (context, parameters) => const IngresoDataPersonal(),
  );
  static Handler pageNotFound =
      Handler(handlerFunc: (context, parameters) => View404());

  static Handler _counterHandlerCapacitacionSeguridad = Handler(
      handlerFunc: (context, parameters) => CapacitacionSeguridad(
            cedula: '',
          ));
}
