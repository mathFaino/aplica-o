// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_reg_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaRegStore on _ConsultaRegStore, Store {
  final _$videoAtom = Atom(name: '_ConsultaRegStore.video');

  @override
  File get video {
    _$videoAtom.reportRead();
    return super.video;
  }

  @override
  set video(File value) {
    _$videoAtom.reportWrite(value, super.video, () {
      super.video = value;
    });
  }

  final _$testeAtom = Atom(name: '_ConsultaRegStore.teste');

  @override
  bool get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(bool value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  final _$relatorioAtom = Atom(name: '_ConsultaRegStore.relatorio');

  @override
  String get relatorio {
    _$relatorioAtom.reportRead();
    return super.relatorio;
  }

  @override
  set relatorio(String value) {
    _$relatorioAtom.reportWrite(value, super.relatorio, () {
      super.relatorio = value;
    });
  }

  final _$sonoAtom = Atom(name: '_ConsultaRegStore.sono');

  @override
  bool get sono {
    _$sonoAtom.reportRead();
    return super.sono;
  }

  @override
  set sono(bool value) {
    _$sonoAtom.reportWrite(value, super.sono, () {
      super.sono = value;
    });
  }

  final _$apetiteAtom = Atom(name: '_ConsultaRegStore.apetite');

  @override
  bool get apetite {
    _$apetiteAtom.reportRead();
    return super.apetite;
  }

  @override
  set apetite(bool value) {
    _$apetiteAtom.reportWrite(value, super.apetite, () {
      super.apetite = value;
    });
  }

  final _$pesoAtom = Atom(name: '_ConsultaRegStore.peso');

  @override
  bool get peso {
    _$pesoAtom.reportRead();
    return super.peso;
  }

  @override
  set peso(bool value) {
    _$pesoAtom.reportWrite(value, super.peso, () {
      super.peso = value;
    });
  }

  final _$cadastradoAtom = Atom(name: '_ConsultaRegStore.cadastrado');

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

  final _$_ConsultaRegStoreActionController =
      ActionController(name: '_ConsultaRegStore');

  @override
  dynamic changeVideo(File file) {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changeVideo');
    try {
      return super.changeVideo(file);
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTeste(bool value) {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changeTeste');
    try {
      return super.changeTeste(value);
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRelatorio(String value) {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changeRelatorio');
    try {
      return super.changeRelatorio(value);
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSono() {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changeSono');
    try {
      return super.changeSono();
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeApetite() {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changeApetite');
    try {
      return super.changeApetite();
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePeso() {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.changePeso');
    try {
      return super.changePeso();
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registrarConsulta(dynamic idP, dynamic idE) {
    final _$actionInfo = _$_ConsultaRegStoreActionController.startAction(
        name: '_ConsultaRegStore.registrarConsulta');
    try {
      return super.registrarConsulta(idP, idE);
    } finally {
      _$_ConsultaRegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
video: ${video},
teste: ${teste},
relatorio: ${relatorio},
sono: ${sono},
apetite: ${apetite},
peso: ${peso},
cadastrado: ${cadastrado}
    ''';
  }
}
