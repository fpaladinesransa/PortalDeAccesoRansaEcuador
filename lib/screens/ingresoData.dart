import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/Screens/body.dart';

class IngresoDataPersonal extends StatefulWidget {
  const IngresoDataPersonal({super.key});

  @override
  State<IngresoDataPersonal> createState() => _IngresoDataPersonalState();
}

class _IngresoDataPersonalState extends State<IngresoDataPersonal> {
  late String nameValue;
  String sedeValue = "";
  final nameController = TextEditingController();
  final cedulaController = TextEditingController();
  final fechaController = TextEditingController();
  final cargoController = TextEditingController();
  final sedeController = DropdownEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;

    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Portal de transportista',
        theme: ThemeData(
          primarySwatch:
              generateMaterialColor(color: Color.fromARGB(255, 0, 155, 8)),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Portal de transportista'),
              actions: [
                IconButton(
                  icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (isDesktop(context))
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Form(
                                key: formKey,
                                child: ListView(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Nombre y apellido:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: cedulaController,
                                      decoration:
                                          InputDecoration(labelText: "Cedula:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: fechaController,
                                      decoration: InputDecoration(
                                          labelText: "Fecha:",
                                          icon: Icon(
                                              Icons.calendar_today_rounded)),
                                      onTap: (() async {
                                        DateTime? pickeddate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2100));
                                        if (pickeddate != null) {
                                          setState(() {
                                            fechaController.text =
                                                DateFormat("dd-MM-yyyy")
                                                    .format(pickeddate);
                                          });
                                        }
                                      }),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: cargoController,
                                      decoration:
                                          InputDecoration(labelText: "Cargo:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Relationship este campo";
                                        }
                                      }),
                                    ),
                                    TextDropdownFormField(
                                      controller: DropdownEditingController(),
                                      options: [
                                        "",
                                        "Guayaquil CD1: Almacenes",
                                        "Guayaquil CD2: Archivo y Distribución",
                                        "Quito CD Parque Industrial Sur - Guamaní"
                                      ],
                                      onSaved: (value) {
                                        sedeValue = "";
                                      },
                                      decoration: InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.arrow_drop_down),
                                          labelText: "Sede:"),
                                      dropdownHeight: 150,
                                      validator: (sedeValue) {
                                        if (sedeValue == "") {
                                          return 'Relationship is required';
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: ancho * 0.17,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            _showCapacitacionPage(context);
                                          },
                                          child: Text("Ir a la capacitación")),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),

                    //-------------------Version Mobil----------------------

                    if (isMobile(context))
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: formKey,
                                child: ListView(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                          labelText: "Nombre y apellido:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: cedulaController,
                                      decoration:
                                          InputDecoration(labelText: "Cedula:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: fechaController,
                                      decoration: InputDecoration(
                                          labelText: "Fecha:",
                                          icon: Icon(
                                              Icons.calendar_today_rounded)),
                                      onTap: (() async {
                                        DateTime? pickeddate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2100));
                                        if (pickeddate != null) {
                                          setState(() {
                                            fechaController.text =
                                                DateFormat("dd-MM-yyyy")
                                                    .format(pickeddate);
                                          });
                                        }
                                      }),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextFormField(
                                      controller: cargoController,
                                      decoration:
                                          InputDecoration(labelText: "Cargo:"),
                                      onSaved: (value) {
                                        nameValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    TextDropdownFormField(
                                      options: [
                                        "Guayaquil CD1: Almacenes",
                                        "Guayaquil CD2: Archivo y Distribución",
                                        "Quito CD Parque Industrial Sur - Guamaní"
                                      ],
                                      decoration: InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.arrow_drop_down),
                                          labelText: "Sede:"),
                                      dropdownHeight: 150,
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ),
                                    SizedBox(
                                      height: ancho * 0.2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 50),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            _showCapacitacionPage(context);
                                          },
                                          child: Text("Ir a la capacitación")),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )));
  }

  void _showCapacitacionPage(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushNamed("/CapacitacionSeguridad");
    }
  }
}
