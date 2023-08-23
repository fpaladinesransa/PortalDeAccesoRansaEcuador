
import 'package:fluro/fluro.dart';

import '../PortalEpp/pages/dropdownprovider.dart';
import '../PortalEpp/pages/gh_home.dart';
import '../PortalEpp/pages/gh_activo.dart';
import '../PortalEpp/pages/gh_renovar.dart';
import '../PortalEpp/pages/home.dart';
import '../PortalEpp/provider/providerEPP.dart';
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
    router.define('/prueba', handler: _counterHandlerGh_prueba);
    router.define('/ghRenovar', handler: _counterHandlerGhRenovarequipo);
    router.define('/ghActivo', handler: _counterHandlerGhActivoequipo);


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

static Handler _counterHandlerGh_prueba = Handler(
    handlerFunc: (context, parameters) => const DropdowntextArea(titulo: '',),
  );

static Handler _counterHandlerGhRenovarequipo = Handler(
    handlerFunc: (context, parameters) =>  GhRenovarequipo(),
  );
static Handler _counterHandlerGhActivoequipo = Handler(
    handlerFunc: (context, parameters) =>  GhActivoequipo(),
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
