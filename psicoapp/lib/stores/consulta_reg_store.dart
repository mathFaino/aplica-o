import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:psicoapp/consts/constsAPI.dart';

part 'consulta_reg_store.g.dart';

class ConsultaRegStore = _ConsultaRegStore with _$ConsultaRegStore;

abstract class _ConsultaRegStore with Store{
  @observable
  File video;

  @action
  changeVideo(File file){
    video = file;
  }

  @observable
  bool teste = false;

  @action
  changeTeste(bool value){
    teste = value;
  }

  @observable
  String relatorio;

  @action
  changeRelatorio(String value){
    relatorio = value;
  }
  @observable
  bool sono = false;

  @action
  changeSono(){
    sono = !sono;
  }
  @observable
  bool apetite = false;

  @action
  changeApetite(){
    apetite = !apetite;
  }
  @observable
  bool peso = false;

  @action
  changePeso(){
    peso = !peso;
  }
  @observable
  bool cadastrado;

  @action
  registrarConsulta(idP, idE){
    cadastrado = null;
    print('merda');
    if((relatorio != null) && (video != null)){
      print("debug");
      criarConsulta(idP, idE).then((value) {
        print('2');
        if(value != null){
          print(3);
          print(value);
          cadastrado = true;
          if(value != 201){
            cadastrado = false;
          }
        }else{
          print('Erro');
          cadastrado = false;
        }
      });
    }

  }

  dispose(){
    relatorio = null;
    apetite = false;
    sono =false;
    peso = false;
    video = null;
  }

  Future<int> criarConsulta(idP, idE) async{
    try{
      var postUri = Uri.parse(ConstsAPi.baseApiURL+'consulta/');
      var request = new http.MultipartRequest("POST", postUri);
      request.fields['relatorio'] = relatorio;
      request.fields['sono_alterado'] = sono.toString();
      request.fields['apetite_alterado'] = apetite.toString();
      request.fields['peso_alterado'] = peso.toString();
      request.fields['paciente'] = idP.toString();
      request.fields['especialista'] = idE.toString();
      request.files.add(await http.MultipartFile.fromPath(
        'video',
        video.path,
        contentType: MediaType('media', 'mp4'),
      ));

      final result = await request.send();
      return result.statusCode;
    }catch(_){
      print(_);
      return null;
    }

  }
}