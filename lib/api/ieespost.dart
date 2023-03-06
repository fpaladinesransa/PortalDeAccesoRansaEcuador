import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectList {
  ProjectList({
    required this.nombre,
    required this.cedula,
    required this.razonSocial,
    this.ruc,
    this.nombreDelEmpleador,
    this.ciudad,
    required this.fechaDeDocumentacion,
    required this.fechaHoraSistema,
    this.tipoDeNovedad,
    this.cargo,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String nombre;
  String cedula;
  String razonSocial;
  String? ruc;
  String? nombreDelEmpleador;
  String? ciudad;
  DateTime fechaDeDocumentacion;
  DateTime fechaHoraSistema;
  String? tipoDeNovedad;
  String? cargo;
  String estado;
  String antedentes;
  String comentario;

  factory ProjectList.fromJson(Map<String, dynamic> map) => ProjectList(
        nombre: map["Nombre"],
        cedula: map["Cedula"],
        razonSocial: map["Razon_Social"],
        ruc: map["RUC"],
        nombreDelEmpleador: map["Nombre_del_Empleador"],
        ciudad: map["Ciudad"],
        fechaDeDocumentacion: DateTime.parse(map["Fecha_de_documentacion"]),
        fechaHoraSistema: DateTime.parse(map["Fecha_hora_sistema"]),
        tipoDeNovedad: map["Tipo_de_novedad"],
        cargo: map["Cargo"],
        estado: map["Estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<ProjectList>> obtenerSeguros({String? query}) async {
  final response = await http.get(Uri.parse("http://192.168.100.116:8080/"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final ProjectMap =
        responseList.map((project) => ProjectList.fromJson(project)).toList();
    if (query != null) {
      return ProjectMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return ProjectMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future enviarEvaluacion(
    String respuesta1,
    String respuesta2,
    String respuesta3,
    String respuesta4,
    String respuesta5,
    String respuesta6,
    String respuesta7,
    String respuesta8,
    String respuesta9,
    String respuesta10,
    String cedula) async {
  final response = await http.post(
      Uri.parse("http://192.168.100.116:8080/actualizacionseguridad"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "pregunta1": respuesta1,
        "pregunta2": respuesta2,
        "pregunta3": respuesta3,
        "pregunta4": respuesta4,
        "pregunta5": respuesta5,
        "pregunta6": respuesta6,
        "pregunta7": respuesta7,
        "pregunta8": respuesta8,
        "pregunta9": respuesta9,
        "pregunta10": respuesta10,
        "cedula": cedula
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future enviarRegistro(
  String cedula,
  String nombre,
  String fecha,
  String cargo,
  String cd,
) async {
  final response =
      await http.post(Uri.parse("http://192.168.100.116:8080/insertseguridad"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "cedula": cedula,
            "nombre": nombre,
            "fecha": fecha,
            "cargo": cargo,
            "cd": cd,
          }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

/* Future enviarEvaluacion2() async {
  final response =
      await http.post(Uri.parse("http://10.132.38.29:8080/evaluacion"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "pregunta1": "respuesta1",
            "pregunta2": "respuesta2",
            "pregunta3": "respuesta3",
            "pregunta4": "respuesta4",
            "pregunta5": "respuesta5",
            "pregunta6": "respuesta6",
            "pregunta7": "respuesta7",
            "pregunta8": "respuesta8",
            "pregunta9": "respuesta9",
            "pregunta10": "respuesta10"
          }));

  if (response.statusCode == 200) {
    print("Subida correctamente");
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
} */
