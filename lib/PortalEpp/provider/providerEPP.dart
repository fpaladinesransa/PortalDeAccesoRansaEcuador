import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EppActivo{
  EppActivo({
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.fechaCompra,
    required this.fechaRenovar,
    required this.nombreEpp,
    required this.estado, 
}
  );

  String nombres;
  String apellidos;
  String cedula;
  DateTime fechaCompra;
  DateTime fechaRenovar;
  String nombreEpp;
  String estado;

  factory EppActivo.fromJson(Map<String, dynamic> map) => EppActivo(
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        fechaRenovar: DateTime.parse(map["FechaRenovar"]),
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
      );


}
Future<List<EppActivo>> eppActivostotales() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/Eppequiposactivos"));
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppActivoAll = responseList
        .map((project) => EppActivo.fromJson(project))
        .toList();

    
    return EppActivoAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}


Future<List<EppActivo>> eppRenovartotales() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/EppequiposRenovar"));
  
  //Nombres,Apellido,Cedula,FechaCompra,FechaRenovar,NombreEpp,Renovar
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppActivoAll = responseList
        .map((project) => EppActivo.fromJson(project))
        .toList();

    
    return EppActivoAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}