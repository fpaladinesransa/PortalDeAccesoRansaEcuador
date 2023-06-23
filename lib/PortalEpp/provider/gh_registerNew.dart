import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey= new GlobalKey<FormState>();

  String nombre="";
  String fecha="01-01-2023";
  String apellido="";
  String cedula="";
  String areadetrabajo="";
  String rolasignado="";
  String cargo="";
  String niveldedotacion="";
  String empresa="";
  String ciudad="";
  String pais="";




  validateForm(){
    if (formKey.currentState!.validate()){
      print("Funciono");
    } else {
      print("No funciono");
    }
  }





}