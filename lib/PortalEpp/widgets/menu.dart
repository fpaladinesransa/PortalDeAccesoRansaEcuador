

import 'package:flutter/material.dart';
/* import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
 */
import '../../routes/router.dart';
import '../pages/gh_actasEntrega.dart';
import '../pages/gh_activo.dart';
import '../pages/gh_home.dart';
import '../pages/gh_renovar.dart';
import '../pages/gh_solicitudEPP.dart';
import '../widgets/menu_item.dart';
import '../widgets/text_separator.dart';


class Gh_menu extends StatelessWidget {
  const Gh_menu({super.key});
 

/*   void navigateTo( String routeName ) {
    NavigationService.navigateTo( routeName );
    SideMenuProvider.closeMenu();
  } */

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: ancho*0.2,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox( height: 10 ),
          MenuItem( text: 'Home', icon: Icons.account_box, onPressed: (){

          }),
          MenuItem( text: 'Generar nuevos regitros', icon: Icons.file_upload, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            Gh_home(),),);
          }),
          MenuItem( text: 'Renovar equipos', icon: Icons.autorenew, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            GhRenovarequipo(),),);
          }),
          MenuItem( text: 'Equipos activos', icon: Icons.dashboard_outlined, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            GhActivoequipo(),),);
          }),
          MenuItem( text: 'Pendientes de entrega', icon: Icons.pageview, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            Gh_home(),),);
          }),
          MenuItem( text: 'Actas de entrega', icon: Icons.picture_as_pdf, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            GHActasEntrega(),),);
          }),
          MenuItem( text: 'Solicitud EPP', icon: Icons.person, onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => 
            GhSolicitudEPPState(),),);
          }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color( 0xff009B3A ),
        Color( 0xff009B3A ),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}