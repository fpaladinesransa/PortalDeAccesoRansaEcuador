import 'package:fluro/fluro.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_eppActivo.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_firma.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_MostrarPdf.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_agregarCol.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_crearUsuario.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_mostrarActaEntrega.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoBabahoyo.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoMachala.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoManta.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoMilagro.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoQuito.dart';
import '../PortalEpp/pages/dropdownprovider.dart';
import '../PortalEpp/pages/gh_actasEntrega.dart';
import '../PortalEpp/pages/gh_home.dart';
import '../PortalEpp/pages/gh_activo.dart';
import '../PortalEpp/pages/gh_renovar.dart';
import '../PortalEpp/pages/gh_solicitudEPP.dart';
import '../PortalEpp/pages/home.dart';
import '../PortalEpp/provider/providerEPP.dart';
import '../screens/portal_estado.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static String rootRoute = '/';

  static void configureRoutes() {
    router.define("home",
        handler: _counterHandler, transitionType: TransitionType.fadeIn);
    router.define('/capacitacion',
        handler: _counterHandlerCapacitacion,
        transitionType: TransitionType.fadeIn);
    router.define('/homePortalEPP',
        handler: _counterhomePortalEPP, transitionType: TransitionType.fadeIn);
    router.define('/ghhome',
        handler: _counterHandlerGh_home, transitionType: TransitionType.fadeIn);
    router.define('/prueba',
        handler: _counterHandlerGh_prueba,
        transitionType: TransitionType.fadeIn);
    router.define('/ghRenovar',
        handler: _counterHandlerGhRenovarequipo,
        transitionType: TransitionType.fadeIn);
    router.define('/ghActivo',
        handler: _counterHandlerGhActivoequipo,
        transitionType: TransitionType.fadeIn);
    router.define('/capacitacionSeguridad',
        handler: _counterHandlerCapacitacionSeguridad,
        transitionType: TransitionType.fadeIn);
    router.define('/ghSolicitudEpp',
        handler: _counterHandlerGhSolicitudEPPState,
        transitionType: TransitionType.fadeIn);
    router.define('/ghActasEntrega',
        handler: _counterHandlerGHActasEntrega,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_CrearUsuario',
        handler: _counterHandlerGh_CrearUsuario,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_AgregarCol',
        handler: _counterHandlerGh_AgregarCol,
        transitionType: TransitionType.fadeIn);

    router.define('/col_Solicitud',
        handler: _counterHandlerColSolicitudes,
        transitionType: TransitionType.fadeIn);
    router.define('/col_Home',
        handler: _counterHandlerColHome, transitionType: TransitionType.fadeIn);
    router.define('/col_Firma',
        handler: _counterHandlerColFirma,
        transitionType: TransitionType.fadeIn);
    router.define('/col_EppActivo',
        handler: _counterHandlerColEppActivo,
        transitionType: TransitionType.fadeIn);

    router.define('/portalEstadoQuito',
        handler: _counterHandlerportalEstadoQuito,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoMilagro',
        handler: _counterHandlerEstadoMilagro,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoMachala',
        handler: _counterHandlerEstadoMachala,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoBabahoyo',
        handler: _counterHandlerEstadoBabahoyo,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoManta',
        handler: _counterHandlerEstadoManta,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = pageNotFound;
  }

  static final Handler _counterHandler = Handler(
    handlerFunc: (context, parameters) =>
        MyApp(asegurados: obtenerSegurosTotales()),
  );
  static final Handler _counterHandlerColSolicitudes = Handler(
    handlerFunc: (context, parameters) => const ColSolicitudes(),
  );
  static final Handler _counterHandlerColHome = Handler(
    handlerFunc: (context, parameters) => const ColHome(),
  );
  static final Handler _counterHandlerColFirma = Handler(
    handlerFunc: (context, parameters) => const ColFirma(),
  );
  static final Handler _counterHandlerColEppActivo = Handler(
    handlerFunc: (context, parameters) => const ColEppActivo(),
  );

  static final Handler _counterHandlerCapacitacion = Handler(
    handlerFunc: (context, parameters) => const IngresoDataPersonal(),
  );

  static final Handler _counterHandlerGh_home = Handler(
    handlerFunc: (context, parameters) => const Gh_home(),
  );
  static final Handler _counterHandlerportalEstadoQuito = Handler(
    handlerFunc: (context, parameters) => const PortalEstadoQuito(),
  );

  static final Handler _counterHandlerGh_prueba = Handler(
    handlerFunc: (context, parameters) => const DropdowntextArea(
      titulo: '',
    ),
  );

  static final Handler _counterHandlerGhRenovarequipo = Handler(
    handlerFunc: (context, parameters) => GhRenovarequipo(),
  );
  static final Handler _counterHandlerGh_MostrarPDF = Handler(
    handlerFunc: (context, parameters) => Gh_MostrarPDF(),
  );

  static final Handler _counterHandlerEstadoMilagro = Handler(
    handlerFunc: (context, parameters) => PortalEstadoMilagro(""),
  );

  static final Handler _counterHandlerEstadoBabahoyo = Handler(
    handlerFunc: (context, parameters) => PortalEstadoBabahoyo(""),
  );

  static final Handler _counterHandlerEstadoMachala = Handler(
    handlerFunc: (context, parameters) => PortalEstadoMachala(""),
  );

  static final Handler _counterHandlerEstadoManta = Handler(
    handlerFunc: (context, parameters) => PortalEstadoManta(""),
  );

  static final Handler _counterHandlerGhActivoequipo = Handler(
    handlerFunc: (context, parameters) => GhActivoequipo(),
  );
  static final Handler _counterHandlerGHActasEntrega = Handler(
    handlerFunc: (context, parameters) => GHActasEntrega(),
  );
  static final Handler _counterHandlerGh_CrearUsuario = Handler(
    handlerFunc: (context, parameters) => Gh_CrearUsuario(),
  );

  static final Handler _counterhomePortalEPP = Handler(
    handlerFunc: (context, parameters) => const SignInScreen(),
  );
  static Handler pageNotFound =
      Handler(handlerFunc: (context, parameters) => View404());

  static final Handler _counterHandlerCapacitacionSeguridad = Handler(
      handlerFunc: (context, parameters) => CapacitacionSeguridad(
            cedula: '',
            cd: '',
          ));

  static final Handler _counterHandlerGhSolicitudEPPState =
      Handler(handlerFunc: (context, parameters) => GhSolicitudEPPState());
  static final Handler _counterHandlerGh_AgregarCol =
      Handler(handlerFunc: (context, parameters) => Gh_AgregarCol());
}
