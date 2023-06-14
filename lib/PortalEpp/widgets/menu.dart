

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

    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 270,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox( height: 10 ),
          MenuItem( text: 'Home', icon: Icons.account_box, onPressed: (){}),
          MenuItem( text: 'Generar nuevos regitros', icon: Icons.file_upload, onPressed: (){}),
          MenuItem( text: 'Renovar equipos', icon: Icons.autorenew, onPressed: (){}),
          MenuItem( text: 'Equipos activos', icon: Icons.dashboard_outlined, onPressed: (){}),
          MenuItem( text: 'Pendientes de entrega', icon: Icons.pageview, onPressed: (){}),
          MenuItem( text: 'Actas de entrega', icon: Icons.picture_as_pdf, onPressed: (){}),
          MenuItem( text: 'Solicitud EPP', icon: Icons.person, onPressed: (){}),
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