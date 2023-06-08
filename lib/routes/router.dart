
import 'package:fluro/fluro.dart';

import '../PortalEpp/pages/gh_home.dart';
import '../PortalEpp/pages/home.dart';
import '../screens/portal_estado.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();
  static String rootRoute     = '/';

  static void configureRoutes() {
    router.define("home", handler: _counterHandler);
    router.define('/capacitacion', handler: _counterHandlerCapacitacion);
    router.define('/homePortalEPP', handler: _counterhomePortalEPP);
    router.define('/ghhome', handler: _counterHandlerGh_home);
/*     router.define( rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
 */    router.define('/capacitacionSeguridad',
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
    static Handler _counterHandlerGh_home = Handler(
    handlerFunc: (context, parameters) => const Gh_home(),
  );




  static Handler _counterhomePortalEPP = Handler(
    handlerFunc: (context, parameters) => const SignInScreen(),
  );
  static Handler pageNotFound =
      Handler(handlerFunc: (context, parameters) => View404());

  static Handler _counterHandlerCapacitacionSeguridad = Handler(
      handlerFunc: (context, parameters) => CapacitacionSeguridad(
            cedula: '',
          ));
}
