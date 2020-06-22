import 'package:psicoapp/models/paciente.dart';

class PacienteList {
  List<Paciente> paciente;

  PacienteList(
      {this.paciente});

  PacienteList.fromJson(List<dynamic> json) {
    if(json != null){
      paciente = List<Paciente>();
      json.forEach((v){
        paciente.add(Paciente.fromJson(v));
      });
    }
  }
}