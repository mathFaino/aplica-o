import 'paciente.dart';

class Atende {
  int especialista;
  Paciente paciente;
  String hora;
  String data;

  Atende({this.especialista, this.paciente, this.hora, this.data});

  Atende.fromJson(Map<String, dynamic> json) {
    especialista = json['especialista'];
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
    hora = json['hora'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['especialista'] = this.especialista;
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    data['hora'] = this.hora;
    data['data'] = this.data;
    return data;
  }
}