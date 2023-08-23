import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/dropdownprovider.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tableActivos.dart';
import 'package:provider/provider.dart';

import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';
import '../widgets/menu.dart';



class GhRenovarequipo extends StatefulWidget {
  

  const GhRenovarequipo({super.key});
  

  @override
  State<GhRenovarequipo> createState() => _GhRenovarequipoState();
}

class _GhRenovarequipoState extends State<GhRenovarequipo> {
  String nombreButon="Prueba";

  






  @override
  Widget build(BuildContext context) {

    Future<List<EppActivo>> dataLista = eppRenovartotales();
    TextEditingController _textoController = TextEditingController(text: "");
    final variables = Provider.of<VariablesExt>(context, listen: true);
    

    

    double ancho = MediaQuery.of(context).size.width;
    return Builder(
      builder: (context) {
        return Scaffold(
          
          body: Row(children: [
            
            Gh_menu(),
            SingleChildScrollView(
              
              child:Column(
                children: [
                  Container(
                    width: ancho*0.8,
                    height: 100,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                                image: AssetImage('assets/Logo_Ransa.png'),
                                height: 140),
                    ),
                  ),
                  Container(height: 50,),
                  Row(
                    children: [
                      Container(
                        child:Text("Buscar:  ", style: TextStyle(color: Colors.grey, fontSize: 20),)
                      ),
                      Container(
                        height: 57,
                        width: 300,
                        child: Card(
                                  child: ListTile(
                                      title: TextField(
                          
                          controller: _textoController,
                          style:TextStyle(color: Colors.grey),

                          textInputAction: TextInputAction.search,
                          onSubmitted: (_) {
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        MyAppConsulta(_textoController.text)))); */
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none),
                          onChanged: (value) {}),
                                      trailing: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        MyAppConsulta(_textoController.text)))); */
                          })),
                                ),
                      ),
                      Container(width: 400,),
                      Container(child: 
                      FutureBuilder<List<EppActivo>>(
                        future: dataLista,
                        
                        builder: (context, snapshot) => Text("Cantidad de registros: ${cantidadLista(snapshot.data)}", style: TextStyle(color: Colors.grey, fontSize: 20),),)
                      
                      
                      ),

                      
                       
                    ],
                  ),
                  Container(height: 20,),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 400,
                    width: 1200,
                    child: FutureBuilder<List<EppActivo>>(
                  future: dataLista,
                  builder: (context, snapshot) {
                    var filterData = snapshot.data;

                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,   
                        children: <Widget>[
                        
                          Expanded(
                            child: Container(
                                child: TablaRenovar(data:filterData,)
                              
                                ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),

                    
                  ),
                Text("${variables.cedula}"),
                DropdownRenovarEquipo(titulo: 'Ingrese una opcion',),
                Container(height: 100,),
                Row(
                  children: [
                    SizedBox(
                                width: 160,
                                height: 35,
                                child: FutureBuilder<List<EppActivo>>(
                                  future: dataLista,
                        
                                  builder: (context, snapshot) {
                                    return ElevatedButton(
                                    
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color( 0xff009B3A ),
                                    ),
                                                          
                                                          
                                    onPressed: () {

                                
                                      
                                
                                      //_exportToExcel();
                                
                                
                                                          
                                                          
                                    },
                                    child: const Text('Actualizar data'),
                                  );
                                  }

                                  
                              ),)
                  ],
                ),

                Container(height: 50,),



                ]),
            )

          ],

          ),
        );
      }
    );
  }
} 
 


