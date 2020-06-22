// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaListStore on _ConsultaListStore, Store {
  Computed<Consultas> _$consultasComputed;

  @override
  Consultas get consultas =>
      (_$consultasComputed ??= Computed<Consultas>(() => super.consultas,
              name: '_ConsultaListStore.consultas'))
          .value;

  final _$_consultasAtom = Atom(name: '_ConsultaListStore._consultas');

  @override
  Consultas get _consultas {
    _$_consultasAtom.reportRead();
    return super._consultas;
  }

  @override
  set _consultas(Consultas value) {
    _$_consultasAtom.reportWrite(value, super._consultas, () {
      super._consultas = value;
    });
  }

  final _$_ConsultaListStoreActionController =
      ActionController(name: '_ConsultaListStore');

  @override
  dynamic listConsultas(dynamic id) {
    final _$actionInfo = _$_ConsultaListStoreActionController.startAction(
        name: '_ConsultaListStore.listConsultas');
    try {
      return super.listConsultas(id);
    } finally {
      _$_ConsultaListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic recarregarConsultas(dynamic id) {
    final _$actionInfo = _$_ConsultaListStoreActionController.startAction(
        name: '_ConsultaListStore.recarregarConsultas');
    try {
      return super.recarregarConsultas(id);
    } finally {
      _$_ConsultaListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consultas: ${consultas}
    ''';
  }
}
