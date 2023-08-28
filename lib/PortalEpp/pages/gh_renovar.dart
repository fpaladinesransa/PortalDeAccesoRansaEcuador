import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/pages/dropdownprovider.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tableActivos.dart';
import 'package:provider/provider.dart';

import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';
import '../widgets/menu.dart';
import '../widgets/text_widget.dart';



class GhRenovarequipo extends StatefulWidget {
  

  const GhRenovarequipo({super.key});
  

  @override
  State<GhRenovarequipo> createState() => _GhRenovarequipoState();
}

class _GhRenovarequipoState extends State<GhRenovarequipo> {
  String nombreButon="Prueba";
  late String fechaValue;
  String opcionRenovar="";


  






  @override
  Widget build(BuildContext context) {

    Future<List<EppActivo>> dataLista = eppRenovartotales();
    Future<List<EppSinAsignar>> dataListaSinAseignar = eppEquiposSinAsignar();


    TextEditingController _textoController = TextEditingController(text: "");
    final variables = Provider.of<VariablesExt>(context, listen: true);
    final variablesDropdown = Provider.of<DropdownService>(context, listen: true);

    

    

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
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none),
                          onChanged: (value) {}),
                                      trailing: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
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
                Row(
                  children: [
                    DropdownRenovarEquipo(titulo: 'Ingrese una opcion',),
                    Container(width: 650,)
                  ],
                ),
                Container(height: 25,),
                Container(
                  width: 950,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      
                    Visibility(        
                          visible: variablesDropdown.renovarSelect.toString()=='Asignar de inventario'? true:false,
                          child: Container(                              
                              alignment: Alignment.topLeft,
                              height: 400,
                              width: 600,
                              child: FutureBuilder<List<EppSinAsignar>>(
                            future: dataListaSinAseignar,
                            builder: (context, snapshot) {
                              var filterDataAsignar = snapshot.data;
                        
                              if (snapshot.hasData) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  verticalDirection: VerticalDirection.down,   
                                  children: <Widget>[
                                  
                                    Expanded(
                                      child: Container(
                                          child: TablaEppSinAsignar(data: filterDataAsignar,)
                                        
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
                        ),
                        Visibility(
                  visible: variablesDropdown.renovarSelect.toString()=='Asignar nuevo equipo'? true:false,
                  child: Container(
                    child: Consumer<DropdownService>(builder: (context, value, child) {
                      return DateCampo(context, value.fechacompraA,
                                  value.fechaControllerA);
                      }),
                  ),
                ),

                      
                      
                    ],
                  ),
                ),
                Container(height: 100,),
                Container(
                  width: 1000,
                  child: TextWidget(
                              text: "Asignar EPP:",
                              textAlignt: TextAlign.left,
                              fontWeight: FontWeight.normal,
                              textcolor: Color.fromARGB(255, 110, 110, 110),
                              textsize: 20,
                            ),
                ),
                SizedBox(height: 10,),
                Container(
                              height: 1,
                              width: 1000,
                              color: Color.fromARGB(255, 110, 110, 110)),

                Text("${variables.idInic},${variables.nombres},${variables.apellido},${variables.epp},${variables.id},${variables.fechaCompra}"),
                
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































  //-------------------------FechaKey------------------------------------




    Column DateCampo(BuildContext context, fechavalue, fechaController) {
    return Column(
      children: [
        Container(
          width: 300,
          child: TextWidget(
            text: "Fecha de compra:",
            fontWeight: FontWeight.normal,
            textcolor: Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
        ),
        Container(
          height: 3,
        ),
        Container(
          child: DateForm(context, fechavalue, fechaController),
          width: 300,
        ),
      ],
    );
  }
  TextFormField DateForm(BuildContext context, fechavalue, fechaControler) {
    return TextFormField(
      onChanged: (value) => fechavalue = value,
      controller: fechaControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onTap: (() async {
        DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (pickeddate != null) {
          setState(() {
            fechaControler.text = DateFormat("dd-MM-yyyy").format(pickeddate);
          });
        }
      }),
      onSaved: (value) {
        fechaValue = DateFormat("MM-dd-yyyy")
            .format(DateFormat('dd-MM-yyyy').parse(value!));
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "Llene este campo";
        }
      }),
    );
  }
} 
 


