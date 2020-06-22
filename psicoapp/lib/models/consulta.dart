import 'dart:convert';

import 'analiseVideo.dart';
import 'paciente.dart';

class Consulta {
  int id;
  String data;
  String video;
  String relatorio;
  bool sonoAlterado;
  bool pesoAlterado;
  bool apetiteAlterado;
  Paciente paciente;
  int especialista;
  AnaliseVideo analiseVideo;

  Consulta(
      {this.id,
        this.data,
        this.video,
        this.relatorio,
        this.sonoAlterado,
        this.pesoAlterado,
        this.apetiteAlterado,
        this.paciente,
        this.especialista,
        this.analiseVideo});

  Consulta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    video = json['video'];
    relatorio = json['relatorio'];
    sonoAlterado = json['sono_alterado'];
    pesoAlterado = json['peso_alterado'];
    apetiteAlterado = json['apetite_alterado'];
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
    especialista = json['especialista'];
    analiseVideo = json['analise_video'] != null
        ? new AnaliseVideo.fromJson(json['analise_video'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['video'] = this.video;
    data['relatorio'] = this.relatorio;
    data['sono_alterado'] = this.sonoAlterado;
    data['peso_alterado'] = this.pesoAlterado;
    data['apetite_alterado'] = this.apetiteAlterado;
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    data['especialista'] = this.especialista;
    if (this.analiseVideo != null) {
      data['analise_video'] = this.analiseVideo.toJson();
    }
    return data;
  }
}