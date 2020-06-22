import 'consulta.dart';

class Consultas {
 List<Consulta> consulta;

  Consultas(
      {this.consulta});

  Consultas.fromJson(List<dynamic> json) {
    if(json != null){
      consulta = List<Consulta>();
      json.forEach((v){
        consulta.add(Consulta.fromJson(v));
      });
    }
  }
}