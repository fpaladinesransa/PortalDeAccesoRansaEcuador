import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../routes/router.dart';
import '../provider/gh_registerNew.dart';
import '../widgets/menu.dart';
import '../widgets/menu_item.dart';
import '../widgets/text_separator.dart';
import '../widgets/text_widget.dart';


class Gh_home extends StatefulWidget {
  const Gh_home({super.key});

  @override
  State<Gh_home> createState() => _Gh_homeState();
}

class _Gh_homeState extends State<Gh_home> {
  late String nameValue;
  late String fechaValue;
  late String areadetrabajo;
  String? dropdownValueRol;
  String? dropdownValueEPP;
  String? dropdownDecBotas;


  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    

    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider= Provider.of<RegisterFormProvider>(context,listen: false);

          return Scaffold(
            body: Row(children: [
              Gh_menu(),
              SingleChildScrollView(
                  child: Form(
                    key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 950,
                          child: TextWidget(
                            text: "Nuevo registros:",
                            textAlignt: TextAlign.left,
                            fontWeight: FontWeight.normal,
                            textcolor: Color.fromARGB(255, 110, 110, 110),
                            textsize: 16,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                            height: 1,
                            width: 950,
                            color: Color.fromARGB(255, 110, 110, 110))
                      ]),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Nombre:",registerFormProvider.nombre),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Apellido:",registerFormProvider.apellido),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Cedula:",registerFormProvider.cedula),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        DateCampo(context,registerFormProvider.fecha),
                        Container(
                          width: 30,
                        ),
                        DropboxRol(
                            "Area de trabajo:",
                            const [
                              DropdownMenuItem(
                                child: Text("Almacenes"),
                                value: "Almacenes",
                              ),
                              DropdownMenuItem(
                                child: Text("Distribución"),
                                value: "Distribucion",
                              ),
                              DropdownMenuItem(
                                child: Text("Administración"),
                                value: "Administración",
                              ),
                              DropdownMenuItem(
                                child: Text("Seguridad"),
                                value: "Seguridad",
                              ),
                            ],
                            registerFormProvider.areadetrabajo),
                        Container(
                          width: 30,
                        ),
                        
                        DropboxRol(
                            "Rol asignado",
                            const [
                              DropdownMenuItem(
                                child: Text("Operario"),
                                value: "Operario",
                              ),
                              DropdownMenuItem(
                                child: Text("Supervisor"),
                                value: "Supervisor",
                              )
                            ],
                            registerFormProvider.rolasignado),

                        /* Container(child:  DropboxCampo(),) */
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Cargo:",dropdownValueRol),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        DropboxRol(
                            "Nivel de dotación:",
                            const [
                              DropdownMenuItem(
                                child: Text("Nivel 1"),
                                value: "Nivel1",
                              ),
                              DropdownMenuItem(
                                child: Text("Nivel 2"),
                                value: "Nivel2",
                              ),
                              DropdownMenuItem(
                                child: Text("Nivel 3"),
                                value: "Nivel3",
                              ),
                              DropdownMenuItem(
                                child: Text("Nivel 4"),
                                value: "Nivel4",
                              ),
                              DropdownMenuItem(
                                child: Text("Nivel 5"),
                                value: "Nivel5",
                              )
                            ],
                            registerFormProvider.niveldedotacion),
                        Container(
                          width: 30,
                        ),
                        DropboxRol(
                            "Empresa:",
                            const [
                              DropdownMenuItem(
                                child: Text("Dash"),
                                value: "Dash",
                              ),
                              DropdownMenuItem(
                                child: Text("Sparky"),
                                value: "Sparky",
                              )
                            ],
                            registerFormProvider.empresa),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Ciudad:",registerFormProvider.ciudad),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        DropboxRol(
                            "País:",
                            const [
                              DropdownMenuItem(
                                child: Text("Dash"),
                                value: "Dash",
                              ),
                              DropdownMenuItem(
                                child: Text("Sparky"),
                                value: "Sparky",
                              )
                            ],
                            registerFormProvider.pais),
                        Container(
                          width: 330,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    //------------ EPP--------------

                    const SizedBox(height: 30),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 950,
                          child: TextWidget(
                            text: "Registrar EPP:",
                            fontWeight: FontWeight.normal,
                            textcolor: Color.fromARGB(255, 110, 110, 110),
                            textsize: 16,
                            textAlignt: TextAlign.left,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                            height: 1,
                            width: 950,
                            color: Color.fromARGB(255, 110, 110, 110))
                      ]),
                    ),
                    Container(
                      height: 30,
                    ),
                    //----------------------Botas----------------------------
                    RegistrosEPP("Botas", dropdownDecBotas)
                  ],
                ),
              ))
            ]),
          );
        }
      ),
    );
  }

  Column RegistrosEPP(titulo, decbotas) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 30,
            ),
            Container(
              width: 100,
              child: TextWidget(
                textAlignt: TextAlign.left,
                text: titulo,
                fontWeight: FontWeight.normal,
                textcolor: Color.fromARGB(255, 110, 110, 110),
                textsize: 16,
              ),
            ),
            DropboxEPP(const [
              DropdownMenuItem(
                child: Text("Si"),
                value: "Si",
              ),
              DropdownMenuItem(
                child: Text("No"),
                value: "No",
              )
            ], decbotas, dropdownDecBotas),
            Container(
              width: 500,
            ),
          ],
        ),
        Container(
          height: 30,
        ),
        if (decbotas == "Si")
          Container(
            child: Row(children: [
              Container(
                width: 30,
              ),
              Image(
                  image: AssetImage('assets/Bota_de_seguridad.png'),
                  height: 200),
              Container(
                width: 30,
              ),
              Column(
                children: [
                  DropboxRol(
                      "Nivel de dotación:",
                      const [
                        DropdownMenuItem(
                          child: Text("Dash"),
                          value: "Dash",
                        ),
                        DropdownMenuItem(
                          child: Text("Sparky"),
                          value: "Sparky",
                        )
                      ],
                      dropdownValueRol),
                  DropboxRol(
                      "Nivel de dotación:",
                      const [
                        DropdownMenuItem(
                          child: Text("Dash"),
                          value: "Dash",
                        ),
                        DropdownMenuItem(
                          child: Text("Sparky"),
                          value: "Sparky",
                        )
                      ],
                      dropdownValueRol),
                  DropboxRol(
                      "Nivel de dotación:",
                      const [
                        DropdownMenuItem(
                          child: Text("Dash"),
                          value: "Dash",
                        ),
                        DropdownMenuItem(
                          child: Text("Sparky"),
                          value: "Sparky",
                        )
                      ],
                      dropdownValueRol),
                ],
              ),
              Container(
                width: 20,
              ),
              Column(
                children: [
                  DropboxRol(
                      "Nivel de dotación:",
                      const [
                        DropdownMenuItem(
                          child: Text("Dash"),
                          value: "Dash",
                        ),
                        DropdownMenuItem(
                          child: Text("Sparky"),
                          value: "Sparky",
                        )
                      ],
                      dropdownValueRol),
                  DropboxRol(
                      "Nivel de dotación:",
                      const [
                        DropdownMenuItem(
                          child: Text("Dash"),
                          value: "Dash",
                        ),
                        DropdownMenuItem(
                          child: Text("Sparky"),
                          value: "Sparky",
                        )
                      ],
                      dropdownValueRol),
                ],
              ),
            ]),
          )
      ],
    );
  }

  Container DropboxRol(textDrop, itemsL, dropdownValue) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 300,
            child: TextWidget(
              text: textDrop,
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
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            width: 300,
            child: DropdownButton(
                items: itemsL,
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Colors.white,
                isExpanded: true,  
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down),
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
              dropdownValue = newValue;
              print(newValue);
              });
            },),
          ),
        ],
      ),
    );
    
  }
  
  void dropdownCallbackRol(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValueRol = selectedValue;
      });
    }
  }

  Column DateCampo(BuildContext context,fechavalue) {
    return Column(
      children: [
        Container(
          width: 300,
          child: TextWidget(
            text: "Fecha:",
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
          child: DateForm(context,fechavalue),
          width: 300,
        ),
      ],
    );
  }

  TextFormField DateForm(BuildContext context,fechavalue) {
    return TextFormField(
      onChanged: (value) =>fechavalue=value,
      controller: fechaController,
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
            fechaController.text = DateFormat("dd-MM-yyyy").format(pickeddate);
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

  Container FormInput(titleinput,valueinput) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TextWidget(
                text: titleinput,
                fontWeight: FontWeight.normal,
                textcolor: Color.fromARGB(255, 110, 110, 110),
                textsize: 16,
                textAlignt: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 3,
          ),
          TextFormField(
            onChanged: (value) => valueinput=value,
            validator: (value){
              if (value==null || value.isEmpty) return "Llene este campo";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onSaved: (value) {
              nameValue = value!;
            },
          ),
        ],
      ),
    );
  }

  Column DropboxEPP(itemsL, String? dropdownValue, String? optionelection) {
    return Column(
      children: [
        Container(
          height: 3,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          width: 300,
          child: DropdownButton(
            items: itemsL,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: SizedBox(),
            icon: Icon(Icons.arrow_drop_down),
            value: dropdownValue,
            onChanged: (String? newValueSelected) {
              setState(() {
                optionelection = newValueSelected;
              });
            },
          ),
        ),
      ],
    );
  }

/*   void dropdownCallbackEpp(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownDecBotas = selectedValue;
      });
    }
  } */
/* textcolor: Color.fromARGB(255, 187, 187, 187) */
}

