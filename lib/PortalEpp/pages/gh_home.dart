

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


class Gh_home extends StatelessWidget {
  const Gh_home({super.key});
 

/*   void navigateTo( String routeName ) {
    NavigationService.navigateTo( routeName );
    SideMenuProvider.closeMenu();
  } */

  @override
  Widget build(BuildContext context) {

    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox( height: 10 ),

          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => {}/* navigateTo( Flurorouter.dashboardRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
           */),

          MenuItem( text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: (){}),
          MenuItem( text: 'Analytic', icon: Icons.show_chart_outlined, onPressed: (){}),
          MenuItem( text: 'Categories', icon: Icons.layers_outlined, onPressed: (){}),
          MenuItem( text: 'Products', icon: Icons.dashboard_outlined, onPressed: (){}),
          MenuItem( text: 'Discount', icon: Icons.attach_money_outlined, onPressed: (){}),
          MenuItem( text: 'Customers', icon: Icons.people_alt_outlined, onPressed: (){}),
          MenuItem( text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: (){}),
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