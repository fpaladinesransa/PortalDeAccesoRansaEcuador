import 'package:flutter/material.dart';

class DropdownService with ChangeNotifier {
  var motivoDropdownList = ['Operario', 'Supervisor'];
  var motivoselected;
  setMotivoValue(value) {
    motivoselected = value;
    notifyListeners();
  }
}

class ColVariables with ChangeNotifier {
  String _idInic = "";
  String _nombres = "";
  get idInic {
    return _idInic;
  }

  set idInicfun(String idInic) {
    _idInic = idInic;
    notifyListeners();
  }

  get nombres {
    return _nombres;
  }

  set nombresfun(String nombres) {
    _nombres = nombres;
    notifyListeners();
  }
}
