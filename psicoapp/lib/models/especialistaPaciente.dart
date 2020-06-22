import 'paciente.dart';

class EspecialistaPaciente {
  int especialista;
  Paciente paciente;

  EspecialistaPaciente(
      {this.especialista, this.paciente});

  EspecialistaPaciente.fromJson(Map<String, dynamic> json) {
    especialista = json['especialista'];
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['especialista'] = this.especialista;
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    return data;
  }
}