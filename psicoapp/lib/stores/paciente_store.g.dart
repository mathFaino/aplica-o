// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PacienteStore on _PacienteStore, Store {
  final _$nomeAtom = Atom(name: '_PacienteStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$cpfAtom = Atom(name: '_PacienteStore.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$susAtom = Atom(name: '_PacienteStore.sus');

  @override
  String get sus {
    _$susAtom.reportRead();
    return super.sus;
  }

  @override
  set sus(String value) {
    _$susAtom.reportWrite(value, super.sus, () {
      super.sus = value;
    });
  }

  final _$dataNascAtom = Atom(name: '_PacienteStore.dataNasc');

  @override
  String get dataNasc {
    _$dataNascAtom.reportRead();
    return super.dataNasc;
  }

  @override
  set dataNasc(String value) {
    _$dataNascAtom.reportWrite(value, super.dataNasc, () {
      super.dataNasc = value;
    });
  }

  final _$cadastradoAtom = Atom(name: '_PacienteStore.cadastrado');

  @override
  bool get cadastrado {
    _$cadastradoAtom.reportRead();
    return super.cadastrado;
  }

  @override
  set cadastrado(bool value) {
    _$cadastradoAtom.reportWrite(value, super.cadastrado, () {
      super.cadastrado = value;
    });
  }

  final _$_PacienteStoreActionController =
      ActionController(name: '_PacienteStore');

  @override
  dynamic changeNomeP(String value) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction(
        name: '_PacienteStore.changeNomeP');
    try {
      return super.changeNomeP(value);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCPF(String value) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction(
        name: '_PacienteStore.changeCPF');
    try {
      return super.changeCPF(value);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSUS(String value) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction(
        name: '_PacienteStore.changeSUS');
    try {
      return super.changeSUS(value);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataNasc(String value) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction(
        name: '_PacienteStore.changeDataNasc');
    try {
      return super.changeDataNasc(value);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registrarPaciente(dynamic esp) {
    final _$actionInfo = _$_PacienteStoreActionController.startAction(
        name: '_PacienteStore.registrarPaciente');
    try {
      return super.registrarPaciente(esp);
    } finally {
      _$_PacienteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
cpf: ${cpf},
sus: ${sus},
dataNasc: ${dataNasc},
cadastrado: ${cadastrado}
    ''';
  }
}
