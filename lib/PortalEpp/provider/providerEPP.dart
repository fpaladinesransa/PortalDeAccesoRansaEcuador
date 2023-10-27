import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EppActivo{
  EppActivo({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.fechaCompra,
    required this.fechaRenovar,
    required this.nombreEpp,
    required this.estado, 
}
  );
  int id;
  String nombres;
  String apellidos;
  String cedula;
  DateTime fechaCompra;
  DateTime fechaRenovar;
  String nombreEpp;
  String estado;

  factory EppActivo.fromJson(Map<String, dynamic> map) => EppActivo(
        id: map["ID"],
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



//--------------------------------------------------------------------------------------

class EppSinAsignar{
  EppSinAsignar({
    required this.id,
    required this.nombreEpp, 
    required this.fechaCompra,
    required this.estado,
    required this.fechainventario,


}
  );

  int id;
  String nombreEpp;
  DateTime fechaCompra;
  String estado;
  DateTime fechainventario;


  factory EppSinAsignar.fromJson(Map<String, dynamic> map) => EppSinAsignar(
        id: map["ID"],
        nombreEpp: map["NombreEpp"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        estado: map["Estado"],
        fechainventario: DateTime.parse(map["FechaenInventario"])
      );


}

Future<List<EppSinAsignar>> eppEquiposSinAsignar() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/EppequiposRenovarsinAsignar"));
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSinAsignarAll = responseList
        .map((project) => EppSinAsignar.fromJson(project))
        .toList();

    
    return EppSinAsignarAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}




Future enviarRenovacion(
    String nombreEpp,
    String estado,
    String cedula,
    String fechaRenovar,
    String fechaDeEntrega,
    String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/EppequiposUpdateRenovar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NombreEpp": nombreEpp,
        "Estado": estado,
        "Cedula": cedula,
        "FechaRenovar": fechaRenovar,
        "FechaDeEntrega": fechaDeEntrega,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}




Future enviarRenovacionBaja(
    String estado,
    String fechabaja,
    String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/EppequiposRenovarBaja"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Estado": estado,
        "Fechabaja": fechabaja,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}


Future insertRenovacionNuevoEquipo(
    String nombreepp,
    String fechaCompra,
    String estado,
    String cedula,
    String fechaRenovar,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/insertequiposEpp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NombreEpp": nombreepp,
        "FechaCompra": fechaCompra,
        "Estado": estado,
        "Cedula": cedula,
        "FechaRenovar": fechaRenovar,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class EppSolicitudList{
  EppSolicitudList({
    required this.id,
    required this.nombres,
    required this.apellidos, 
    required this.cedula,
    required this.fechaCompra,
    required this.fechaDeEntrega,
    required this.nombreEpp,
    required this.estado,
    required this.motivo,    
    required this.comentarios,
}
  );
  int id;
  String nombres;
  String apellidos;
  String cedula;
  DateTime fechaCompra;
  DateTime fechaDeEntrega;
  String nombreEpp;
  String estado;
  String motivo;
  String comentarios;
  factory EppSolicitudList.fromJson(Map<String, dynamic> map) => EppSolicitudList(
        id:map["ID"],
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        fechaDeEntrega: DateTime.parse(map["FechaDeEntrega"]),
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
        motivo: map["Motivo"],
        comentarios: map["Comentarios"],
      );
}



Future<List<EppSolicitudList>> eppSolicitudEppGH() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/SelectGHsolicitud"));
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSolicitudListAll = responseList
        .map((project) => EppSolicitudList.fromJson(project))
        .toList();

    
    return EppSolicitudListAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}




Future insertGHsolicitud(
    String requrimiento,
    String solicitud,
    String motivo,
    String fechaSolicitud,
    String comentarios,
    String estado,
    String id

) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/InsertGHsolicitud"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Requerimiento": requrimiento,
        "Solicitante": solicitud,
        "Motivo": motivo,
        "Fecha_Solicitud": fechaSolicitud,
        "Comentario": comentarios,
        "Estado": estado,
        "ID_Epp": id,


      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}













Future actualizarGHsolicitud(
    String tieneSolicitud,
    String estado,
    String comentarios,
    String id,


) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/UpdateGHSolicitud"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "TieneSolicitud": tieneSolicitud,
        "Estado": estado,
        "Comentarios": comentarios,
        "ID": id,



      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}






class EppSelectFirmaGH{
  EppSelectFirmaGH({
    required this.id,
    required this.nombres,
    required this.apellidos, 
    required this.cedula,
    required this.nombreEpp,
    required this.estado,
    required this.urlFirma,    
}
  );
  int id;
  String nombres;
  String apellidos;
  String cedula;
  String nombreEpp;
  String estado;
  String urlFirma;
  factory EppSelectFirmaGH.fromJson(Map<String, dynamic> map) => EppSelectFirmaGH(
        id:map["ID"],
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
        urlFirma: map["UrlFirma"],

      );
}



Future<List<EppSelectFirmaGH>> eppSelectFirmaGH() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/SelectGhFirma"));
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSelectFirmaGHAll = responseList
        .map((project) => EppSelectFirmaGH.fromJson(project))
        .toList();

    
    return EppSelectFirmaGHAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//InsertActadeEntrega


Future insertActadeEntregaEpp(
    String idepp,
    String nombre,
    String apellido,
    String cedula,
    String firma,
    String estado,
    String epp,
    String codigoTrabajador

) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/InsertActadeEntregaEpp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ID_epp": idepp,
        "Nombre": nombre,
        "Apellidos": apellido,
        "Cedula": cedula,
        "Firma": firma,
        "Estado": estado,
        "epp": epp,
        "CodigoTrabajador": codigoTrabajador,


      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}





class EppSelectActadeEntrega{
  EppSelectActadeEntrega({
    required this.idepp,
    required this.nombres,
    required this.apellidos, 
    required this.cedula,
    required this.firma,
    required this.estado,
    required this.epp,
    required this.codigoTrabajador   
}
  );
  String idepp;
  String nombres;
  String apellidos;
  String cedula;
  String firma;
  String estado;
  String epp;
  String codigoTrabajador;
  factory EppSelectActadeEntrega.fromJson(Map<String, dynamic> map) => EppSelectActadeEntrega(
        idepp:map["ID_epp"],
        nombres: map["Nombre"],
        apellidos: map["Apellidos"],
        cedula: map["Cedula"],
        firma: map["Firma"],
        estado: map["Estado"],
        epp: map["epp"],
        codigoTrabajador: map["CodigoTrabajador"],

      );
}



Future<List<EppSelectActadeEntrega>> eppSelectActadeEntrega() async {
  
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/SelectAllActadeEntregaEpp"));
      
  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSelectActadeEntregaAll = responseList
        .map((project) => EppSelectActadeEntrega.fromJson(project))
        .toList();

    
    return EppSelectActadeEntregaAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}