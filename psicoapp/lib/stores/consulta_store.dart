import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/analiseVideo.dart';

part 'consulta_store.g.dart';

class ConsultaStore = _ConsultaStore with _$ConsultaStore;

abstract class _ConsultaStore with Store{
  @observable
   int _item;

  @computed
  int get item => _item;

  @action
  setConsulta(int index){
    _item = null;
    _item = index;
  }

  @observable
  bool analisando = false;

  @action
  analisarVideo(String video, id, esp, Function func){
    analisando = true;
    criarAnalise(video).then((value) {
      print(value);
      if(value != null){
        salvarAnalise(value, id).then((status) {
          if(status != null){
            print(status);
            analisando = false;
            func(esp);
          }else{
            analisando = false;
          }
        });
      } else{
        analisando = false;
      }
    });
  }

  Future<dynamic> criarAnalise(String caminho) async{
    try{
      final response = await http.post(ConstsAPi.baseApiURL+'analise_video/', body: <String, dynamic> { 'video': caminho });
      var decodedJson = await jsonDecode(response.body);
      AnaliseVideo analiseVideo = AnaliseVideo.fromJson(decodedJson);
      return analiseVideo.id;
    }catch(_){
      print(_);
      return null;
    }
  }

  Future<int> salvarAnalise(id, idCon) async{
    try{
      Dio dio = Dio();
      Response response = await dio.patch(ConstsAPi.baseApiURL+'consulta/' + idCon.toString() + '/',
        data: {
        'analise_video': id,
        },);
      print(response.data);
      return response.statusCode;
    }catch(_){
      print(_);
      return null;
    }
  }

}
