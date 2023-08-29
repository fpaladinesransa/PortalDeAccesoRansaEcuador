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
                  Container(
                    width: ancho*0.8,
                    child: Row(
                      children: [
                        Container(width:ancho*0.1),
                        Container(
                          child:Text("Buscar:  ", style: TextStyle(color: Colors.grey, fontSize: 20),)
                        ),
                        Container(
                          height: 57,
                          width: ancho*0.15,
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
                        Container(width: ancho*0.3,),
                        Container(child: 
                        FutureBuilder<List<EppActivo>>(
                          future: dataLista,                        
                          builder: (context, snapshot) => Text("Cantidad de registros: ${cantidadLista(snapshot.data)}", style: TextStyle(color: Colors.grey, fontSize: 20),),)
                        ),
                  
                        
                         
                      ],
                    ),
                  ),
                  Container(height: 20,),
                  Container(
                    width: ancho*0.8,
                    child: Row(
                      
                      children: [
                        Container(width:ancho*0.1),
                        Container(
                          height: 400,
                          width:ancho*0.6,
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
                      ],
                    ),
                  ),
                Container(
                  width: ancho*0.8,
                  child: Row(
                    children: [
                      Container(width: ancho*0.1,),
                      DropdownRenovarEquipo(titulo: 'Ingrese una opcion',),
                    ],
                  ),
                ),
                Container(height: 25,),
                Container(
                  width: ancho*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Container(width:ancho*0.1),
                    Visibility(        
                          visible: variablesDropdown.renovarSelect.toString()=='Asignar de inventario'? true:false,
                          child: Container(                              
                              alignment: Alignment.topLeft,
                              height: 300,
                              width: ancho*0.6,
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
                  width: ancho*0.8,
                  child: Row(
                    children: [
                      Container(width: ancho*0.1,),
                      Container(
                        width: ancho*0.6,
                        child: TextWidget(
                                    text: "Asignar EPP:",
                                    textAlignt: TextAlign.left,
                                    fontWeight: FontWeight.normal,
                                    textcolor: Color.fromARGB(255, 110, 110, 110),
                                    textsize: 20,
                                  ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: ancho*0.8,
                  child: Row(
                    children: [
                      Container(width: ancho*0.1,),
                      Container(
                                    height: 1,
                                    width: 1000,
                                    color: Color.fromARGB(255, 110, 110, 110)),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  width: ancho*0.8,
                  child: Row(
                    children: [
                      Container(width:ancho*0.1),
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                              child: DataTable(
                      decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),borderRadius: BorderRadius.circular(10)),
                      sortColumnIndex: 0,
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text("ID"), numeric: true, tooltip: "Id"),
                        DataColumn(label: Text("Nombres"), numeric: false, tooltip: "Nombre"),
                        DataColumn(label: Text("Apellidos"), numeric: false, tooltip: "Apellidos"),
                        DataColumn(
                            label: Text("EPP"),
                            numeric: false,
                            tooltip: "EPP"),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('${variables.idInic}')),
                            DataCell(Text('${variables.nombres}')),
                            DataCell(Text('${variables.apellido}')),
                            DataCell(Text('${variables.epp}')),
                          ],)]

                              ),
                          ),
                           SizedBox(width: 20,),

                          const Column(
                            children: [
                              Text("Asignar recurso"),
                              Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Color( 0xff009B3A ),
                                    size: 14.0,
                                  ),
                            ],
                          ),
                          SizedBox(width: 20,),

                          SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                              child: DataTable(
                      decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),borderRadius: BorderRadius.circular(10)),
                      sortColumnIndex: 0,
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text("ID"), numeric: true, tooltip: "Id"),
                        DataColumn(label: Text("Fecha compra"), numeric: false, tooltip: "Fecha compra"),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('${variables.id}')),
                            DataCell(Text('${variables.fechaCompra}')),
                          ],)]

                              ),
                          ),

                    ],
                  ),
                ),
                SizedBox(height: 50,),



                
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
 


