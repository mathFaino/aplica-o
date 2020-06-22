// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilStore on _PerfilStore, Store {
  final _$posPacienteAtom = Atom(name: '_PerfilStore.posPaciente');

  @override
  int get posPaciente {
    _$posPacienteAtom.reportRead();
    return super.posPaciente;
  }

  @override
  set posPaciente(int value) {
    _$posPacienteAtom.reportWrite(value, super.posPaciente, () {
      super.posPaciente = value;
    });
  }

  final _$especialistaAtom = Atom(name: '_PerfilStore.especialista');

  @override
  Especialista get especialista {
    _$especialistaAtom.reportRead();
    return super.especialista;
  }

  @override
  set especialista(Especialista value) {
    _$especialistaAtom.reportWrite(value, super.especialista, () {
      super.especialista = value;
    });
  }

  final _$idAtom = Atom(name: '_PerfilStore.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$_PerfilStoreActionController = ActionController(name: '_PerfilStore');

  @override
  dynamic recarregarPerfil() {
    final _$actionInfo = _$_PerfilStoreActionController.startAction(
        name: '_PerfilStore.recarregarPerfil');
    try {
      return super.recarregarPerfil();
    } finally {
      _$_PerfilStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPerfil(dynamic v) {
    final _$actionInfo = _$_PerfilStoreActionController.startAction(
        name: '_PerfilStore.setPerfil');
    try {
      return super.setPerfil(v);
    } finally {
      _$_PerfilStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posPaciente: ${posPaciente},
especialista: ${especialista},
id: ${id}
    ''';
  }
}
