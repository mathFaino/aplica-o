// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaStore on _ConsultaStore, Store {
  Computed<int> _$itemComputed;

  @override
  int get item => (_$itemComputed ??=
          Computed<int>(() => super.item, name: '_ConsultaStore.item'))
      .value;

  final _$_itemAtom = Atom(name: '_ConsultaStore._item');

  @override
  int get _item {
    _$_itemAtom.reportRead();
    return super._item;
  }

  @override
  set _item(int value) {
    _$_itemAtom.reportWrite(value, super._item, () {
      super._item = value;
    });
  }

  final _$analisandoAtom = Atom(name: '_ConsultaStore.analisando');

  @override
  bool get analisando {
    _$analisandoAtom.reportRead();
    return super.analisando;
  }

  @override
  set analisando(bool value) {
    _$analisandoAtom.reportWrite(value, super.analisando, () {
      super.analisando = value;
    });
  }

  final _$_ConsultaStoreActionController =
      ActionController(name: '_ConsultaStore');

  @override
  dynamic setConsulta(int index) {
    final _$actionInfo = _$_ConsultaStoreActionController.startAction(
        name: '_ConsultaStore.setConsulta');
    try {
      return super.setConsulta(index);
    } finally {
      _$_ConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic analisarVideo(String video, dynamic id, dynamic esp, Function func) {
    final _$actionInfo = _$_ConsultaStoreActionController.startAction(
        name: '_ConsultaStore.analisarVideo');
    try {
      return super.analisarVideo(video, id, esp, func);
    } finally {
      _$_ConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
analisando: ${analisando},
item: ${item}
    ''';
  }
}
