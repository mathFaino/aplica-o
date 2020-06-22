import 'package:mobx/mobx.dart';
import 'package:psicoapp/models/pacienteList.dart';

part 'paciente_list_store.g.dart';

class PacienteListStore = _PacienteListStore with _$PacienteListStore;

abstract class _PacienteListStore with Store{
  @observable
  PacienteList pacienteList;



}