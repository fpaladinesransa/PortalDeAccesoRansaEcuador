import 'package:flutter/material.dart';

import '../api/ieespost.dart';

SingleChildScrollView tablaBody(List<ProjectList>? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Nombre"), numeric: false, tooltip: "Nombre"),
          DataColumn(label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
          DataColumn(
              label: Text("Razon social"),
              numeric: false,
              tooltip: "Razon social"),
          DataColumn(
              label: Text("Fecha doc"),
              numeric: false,
              tooltip: "Fecha documentacion"),
          DataColumn(
              label: Text("Fecha sub"),
              numeric: false,
              tooltip: "Fecha subida"),
          DataColumn(label: Text("Estado"), numeric: false, tooltip: "Estado"),
          DataColumn(
              label: Text("Antecedente"),
              numeric: false,
              tooltip: "Antecedente"),
          DataColumn(
              label: Text("Comentario"), numeric: false, tooltip: "Comentario"),
        ],
        rows: data!
            .map(
              (valor) => DataRow(cells: [
                DataCell(Text(valor.nombre)),
                DataCell(Text(valor.cedula)),
                DataCell(Text(valor.razonSocial)),
                DataCell(Text(valor.fechaDeDocumentacion.day.toString() +
                    "/" +
                    valor.fechaDeDocumentacion.month.toString() +
                    "/" +
                    valor.fechaDeDocumentacion.year.toString())),
                DataCell(Text(valor.fechaHoraSistema.day.toString() +
                    "/" +
                    valor.fechaHoraSistema.month.toString() +
                    "/" +
                    valor.fechaHoraSistema.year.toString())),
                DataCell(Text(valor.estado)),
                DataCell(Text(valor.antedentes)),
                DataCell(Text(valor.comentario)),
              ]),
            )
            .toList(),
      ),
    ),
  );
}
