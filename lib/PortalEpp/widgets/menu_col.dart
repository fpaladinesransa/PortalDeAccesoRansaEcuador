

import 'package:flutter/material.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import '../widgets/menu_item.dart';



class Col_menu extends StatelessWidget {
  const Col_menu({super.key});
 

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
          MenuItem( text: 'Home', icon: Icons.home, onPressed: (){
          }),
          MenuItem( text: 'Mis epp', icon: Icons.account_box, 
          onPressed: (){
            locator<NavigationService>().navigateTo('/ghhome');
          }),
          MenuItem( text: 'Firma pendiente epp', icon: Icons.mode_edit, onPressed: (){
            locator<NavigationService>().navigateTo('/ghRenovar');

          }),
          MenuItem( text: 'Solicitud epp', icon: Icons.new_releases, onPressed: (){
            locator<NavigationService>().navigateTo('/ghActivo');
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