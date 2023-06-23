import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
/* import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
 */
import '../../routes/router.dart';
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

  final nameController = TextEditingController();
  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Scaffold(
      body: Row(children: [
        Gh_menu(),
        SingleChildScrollView(
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
                  child: FormInput("Nombre:"),
                  width: 300,
                ),
                Container(
                  width: 30,
                ),
                Container(
                  child: FormInput("Apellido:"),
                  width: 300,
                ),
                Container(
                  width: 30,
                ),
                Container(
                  child: FormInput("Cedula:"),
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
                DateCampo(context),
                Container(
                  width: 30,
                ),
                DropboxRol(
                    "Area de trabajo:",
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
                Container(
                  width: 30,
                ),
                DropboxRol(
                    "Rol asignado",
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
                  child: FormInput("Cargo:"),
                  width: 300,
                ),
                Container(
                  width: 30,
                ),
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
                    dropdownValueRol),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 30,
                ),
                Container(
                  child: FormInput("Ciudad:"),
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
                    dropdownValueRol),
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
            Row(
              children: [
                Container(
                  width: 30,
                ),
                Container(
                  width: 100,
                  child: TextWidget(
                    textAlignt: TextAlign.left,
                    text: "Botas:",
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
                ], dropdownValueEPP),
                Container(
                  width: 500,
                ),
              ],
            ),
            Container(
              height: 30,
            ),
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
                Container(width: 20,),
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
        ))
      ]),
    );
  }

  Column DropboxRol(textDrop, itemsL, String? dropdownValue) {
    return Column(
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
          padding: EdgeInsets.only(left: 16, right: 16),
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
              onChanged: dropdownCallbackRol),
        ),
      ],
    );
  }

  void dropdownCallbackRol(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValueRol = selectedValue;
      });
    }
  }

  Column DateCampo(BuildContext context) {
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
          child: DateForm(context),
          width: 300,
        ),
      ],
    );
  }

  TextFormField DateForm(BuildContext context) {
    return TextFormField(
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

  Container FormInput(textinput) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TextWidget(
                text: textinput,
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
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onSaved: (value) {
              nameValue = value!;
            },
            validator: ((value) {
              if (value!.isEmpty) {
                return "Llene este campo";
              }
            }),
          ),
        ],
      ),
    );
  }

  Column DropboxEPP(itemsL, String? dropdownValue) {
    return Column(
      children: [
        Container(
          height: 3,
        ),
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
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
              onChanged: dropdownCallbackEpp),
        ),
      ],
    );
  }

  void dropdownCallbackEpp(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownValueEPP = selectedValue;
      });
    }
  }
/* textcolor: Color.fromARGB(255, 187, 187, 187) */
}
