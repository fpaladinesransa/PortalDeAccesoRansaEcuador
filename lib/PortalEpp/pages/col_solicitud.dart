import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_col.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';
import 'package:provider/provider.dart';

class ColSolicitudes extends StatefulWidget {
  const ColSolicitudes({super.key});

  @override
  State<ColSolicitudes> createState() => _ColSolicitudesState();
}

String cedula = '0967096733';

Future<List<TablasColSelectSolicitudEpp>> dataLista =
    obtenerTablasColSelectSolicitudEpp(query: cedula);

class _ColSolicitudesState extends State<ColSolicitudes> {
  late String nameValue;

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Scaffold(
              body: Row(
            children: [
              Col_menu(),
              Container(
                width: ancho * 0.8,
                child: SingleChildScrollView(
                  key: registerFormProvider.formKey,
                  child: Form(
                    child: Consumer<DropdownService>(
                        builder: (context, value, chil) {
                      return Column(
                        children: [
                          ImagenRansaTop(ancho: ancho),
                          SeparadorTitulo(
                            titulo:
                                'Haga click en el EPP que quisiera reportar:',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 400,
                            width: 1075,
                            child: FutureBuilder<
                                    List<TablasColSelectSolicitudEpp>>(
                                future: dataLista,
                                builder: (context, snapshot) {
                                  var filterData = snapshot.data;
                                  if (snapshot.hasData) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      children: <Widget>[
                                        Expanded(
                                          child: TablaColSolicitud(
                                            data: filterData,
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return const CircularProgressIndicator();
                                }),
                          ),
                          SeparadorTitulo(
                            titulo: 'Escribir los motivos',
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: ancho * 0.05,
                                ),
                                SizedBox(
                                  child: FormInput(
                                      "Nombre:",
                                      value.cedulaSelect,
                                      value.setcedulaSelect),
                                  width: 300,
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  child: FormInput("Fecha:", value.cedulaSelect,
                                      value.setcedulaSelect),
                                  width: 300,
                                ),
                                Container(
                                  width: 10,
                                ),
                                Container(
                                  child: FormInput(
                                      "Motivo:",
                                      value.cedulaSelect,
                                      value.setcedulaSelect),
                                  width: 300,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: alto * 0.03,
                          ),
                          Row(
                            children: [
                              Container(
                                width: ancho * 0.05,
                              ),
                              SizedBox(
                                width: ancho * 0.6,
                                child: FormLargeInput("Comentario:",
                                    value.cedulaSelect, value.setcedulaSelect),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ));
        }));
  }

  Column FormInput(titleinput, valueinput, dynamic setfunction) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            text: titleinput,
            fontWeight: FontWeight.normal,
            textcolor: const Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
        ),
        Container(
          height: 3,
        ),
        TextFormField(
          onChanged: (String? v) {
            setfunction(v);
          },
          validator: (value) {
            if (value == null || value.isEmpty) return "Llene este campo";
            return null;
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onSaved: (value) {
            nameValue = value!;
          },
        ),
      ],
    );
  }

  Column FormLargeInput(titleinput, valueinput, dynamic setfunction) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            text: titleinput,
            fontWeight: FontWeight.normal,
            textcolor: const Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
        ),
        Container(
          height: 3,
        ),
        SizedBox(
          height: 100,
          child: TextFormField(
            expands: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (String? v) {
              setfunction(v);
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Llene este campo";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onSaved: (value) {
              nameValue = value!;
            },
          ),
        ),
      ],
    );
  }
}

class ImagenRansaTop extends StatelessWidget {
  const ImagenRansaTop({
    super.key,
    required this.ancho,
  });

  final double ancho;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho * 0.8,
      height: 100,
      child: const Align(
        alignment: Alignment.topRight,
        child: Image(image: AssetImage('assets/Logo_Ransa.png'), height: 140),
      ),
    );
  }
}
