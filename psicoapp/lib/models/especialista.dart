import 'dart:io';

import 'atende.dart';

class Especialista {
  int id;
  String nome;
  int usuario;
  String imagemPerfil;
  String crp;
  String crm;
  String cpf;
  String email;
  int telefone;
  List<Atende> atende;

  Especialista(
      {this.id,
        this.nome,
        this.usuario,
        this.imagemPerfil,
        this.crp,
        this.crm,
        this.cpf,
        this.email,
        this.telefone,
        this.atende});

  Especialista.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    usuario = json['usuario'];
    imagemPerfil = json['imagem_perfil'];
    crp = json['CRP'];
    crm = json['CRM'];
    cpf = json['CPF'];
    email = json['email'];
    telefone = json['telefone'];
    if (json['atende'] != null) {
      atende = new List<Atende>();
      json['atende'].forEach((v) {
        atende.add(new Atende.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['usuario'] = this.usuario;
    data['imagem_perfil'] = this.imagemPerfil;
    data['CRP'] = this.crp;
    data['CRM'] = this.crm;
    data['CPF'] = this.cpf;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    if (this.atende != null) {
      data['atende'] = this.atende.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
