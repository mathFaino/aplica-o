import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/especialistaPaciente.dart';
import 'package:psicoapp/models/paciente.dart';

part 'paciente_store.g.dart';

class PacienteStore = _PacienteStore with _$PacienteStore;

abstract class _PacienteStore with Store{
  @observable
  String nome;

  @action
  changeNomeP(String value){
    nome = value;
  }

  @observable
  String cpf;

  @action
  changeCPF(String value){
    cpf = value;
  }

  @observable
  String sus;

  @action
  changeSUS(String value){
    sus = value;
  }

  @observable
  String dataNasc;

  @action
  changeDataNasc(String value){
    dataNasc = value;
  }
  @observable
  bool cadastrado;


  @action
  registrarPaciente(esp){
    cadastrado = null;
    print(cpf);
    print(nome);
    print(sus);
    print(dataNasc);
    if((cpf != null) && (nome != null) && (sus != null) && (dataNasc != null)){
      print('Entrou');
      print(dataNasc.split('/').last + '-' + dataNasc.split('/')[1] + '-' + dataNasc.split('/').first);
      Paciente paciente = Paciente(nome: nome, cPF: cpf.toString(),
          dataNascimento: dataNasc.split('/').last + '-' + dataNasc.split('/')[1] + '-' + dataNasc.split('/').first,
          sus: int.parse(sus));
      print('passou');
      //EspecialistaPaciente espPaci = EspecialistaPaciente(especialista: esp, paciente: paciente);
      print('criou');
     criarPac(paciente).then((pac){
       criarEspPac(pac.id, esp).then((value) {
         print('tentou');
         print(value);
         if(value == 201){
           cadastrado = true;
         }else{
           cadastrado = false;
         }
       });
     });
    }else{
      print('Não entrou!');
      cadastrado = false;
    }
  }

  Future<Paciente> criarPac(Paciente espP) async{
    try{
      print('tetando paciente');
      final response = await http.post(ConstsAPi.baseApiURL+'paciente/', body: {
        'nome' : espP.nome,
        'CPF' : espP.cPF,
        'sus' : espP.sus.toString(),
        'data_nascimento' : espP.dataNascimento
      });
      print('teste');
      var decodedJson = await jsonDecode(response.body);
      return Paciente.fromJson(await decodedJson);
    }catch(_){
      print(_);
      return null;
    }
  }
  Future<int> criarEspPac(pac, esp) async{
    try{
      print('tetando conectar');
      final response = await http.post(ConstsAPi.baseApiURL+'especialistaPaciente/', body: {
        'paciente' : pac.toString(),
        'especialista' : esp.toString()
      });
      return await response.statusCode;
    }catch(_){
      print(_);
      return null;
    }
  }

}