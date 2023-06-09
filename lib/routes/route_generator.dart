import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../PortalEpp/pages/gh_home.dart';
import '../PortalEpp/pages/home.dart';
import '../Screens/portal_estado.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _fadeRoute(MyApp(asegurados: obtenerSegurosTotales()), '/home');
        case '/homePortalEPP':
      return _fadeRoute(SignInScreen(), '/homePortalEPP');

      case '/capacitacion':
        return _fadeRoute(IngresoDataPersonal(), '/capacitacion');
      case '/ghhome':
        return _fadeRoute(Gh_home(), '/capacitacion');

      case '/CapacitacionSeguridad':
        return _fadeRoute(
            CapacitacionSeguridad(
              cedula: '',
            ),
            '/CapacitacionSeguridad');

      default:
        return _fadeRoute(View404(), '/404');
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: Duration(milliseconds: 10000),
        transitionsBuilder: (_, animation, __, ___) => (kIsWeb)
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                child: child,
                linearTransition: true));
  }
}
