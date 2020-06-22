// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PacienteListStore on _PacienteListStore, Store {
  final _$pacienteListAtom = Atom(name: '_PacienteListStore.pacienteList');

  @override
  PacienteList get pacienteList {
    _$pacienteListAtom.reportRead();
    return super.pacienteList;
  }

  @override
  set pacienteList(PacienteList value) {
    _$pacienteListAtom.reportWrite(value, super.pacienteList, () {
      super.pacienteList = value;
    });
  }

  @override
  String toString() {
    return '''
pacienteList: ${pacienteList}
    ''';
  }
}
