import 'especialista.dart';

class TrueSpecialist {
  List<Especialista> especialista;

  TrueSpecialist(
      {this.especialista});

  TrueSpecialist.fromJson(List<dynamic> json) {
    if(json != null){
      especialista = List<Especialista>();
      json.forEach((v){
        especialista.add(Especialista.fromJson(v));
      });
    }
  }
}