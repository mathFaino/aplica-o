// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<File> _$getImageComputed;

  @override
  File get getImage => (_$getImageComputed ??=
          Computed<File>(() => super.getImage, name: '_CadastroStore.getImage'))
      .value;
  Computed<bool> _$verificadosComputed;

  @override
  bool get verificados =>
      (_$verificadosComputed ??= Computed<bool>(() => super.verificados,
              name: '_CadastroStore.verificados'))
          .value;

  final _$_imageAtom = Atom(name: '_CadastroStore._image');

  @override
  File get _image {
    _$_imageAtom.reportRead();
    return super._image;
  }

  @override
  set _image(File value) {
    _$_imageAtom.reportWrite(value, super._image, () {
      super._image = value;
    });
  }

  final _$_nomeAtom = Atom(name: '_CadastroStore._nome');

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
    });
  }

  final _$_emailAtom = Atom(name: '_CadastroStore._email');

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  final _$_crpAtom = Atom(name: '_CadastroStore._crp');

  @override
  String get _crp {
    _$_crpAtom.reportRead();
    return super._crp;
  }

  @override
  set _crp(String value) {
    _$_crpAtom.reportWrite(value, super._crp, () {
      super._crp = value;
    });
  }

  final _$_crmAtom = Atom(name: '_CadastroStore._crm');

  @override
  String get _crm {
    _$_crmAtom.reportRead();
    return super._crm;
  }

  @override
  set _crm(String value) {
    _$_crmAtom.reportWrite(value, super._crm, () {
      super._crm = value;
    });
  }

  final _$_cpfAtom = Atom(name: '_CadastroStore._cpf');

  @override
  String get _cpf {
    _$_cpfAtom.reportRead();
    return super._cpf;
  }

  @override
  set _cpf(String value) {
    _$_cpfAtom.reportWrite(value, super._cpf, () {
      super._cpf = value;
    });
  }

  final _$_telefoneAtom = Atom(name: '_CadastroStore._telefone');

  @override
  String get _telefone {
    _$_telefoneAtom.reportRead();
    return super._telefone;
  }

  @override
  set _telefone(String value) {
    _$_telefoneAtom.reportWrite(value, super._telefone, () {
      super._telefone = value;
    });
  }

  final _$_usernameAtom = Atom(name: '_CadastroStore._username');

  @override
  String get _username {
    _$_usernameAtom.reportRead();
    return super._username;
  }

  @override
  set _username(String value) {
    _$_usernameAtom.reportWrite(value, super._username, () {
      super._username = value;
    });
  }

  final _$_passwordAtom = Atom(name: '_CadastroStore._password');

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  final _$cadastradoAtom = Atom(name: '_CadastroStore.cadastrado');

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

  final _$selectImageAsyncAction = AsyncAction('_CadastroStore.selectImage');

  @override
  Future<dynamic> selectImage() {
    return _$selectImageAsyncAction.run(() => super.selectImage());
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMail(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeMail');
    try {
      return super.changeMail(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCrp(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeCrp');
    try {
      return super.changeCrp(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCrm(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeCrm');
    try {
      return super.changeCrm(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCpf(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePhone(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changePhone');
    try {
      return super.changePhone(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUsername(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changeUsername');
    try {
      return super.changeUsername(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cadastrar() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.cadastrar');
    try {
      return super.cadastrar();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cadastrado: ${cadastrado},
getImage: ${getImage},
verificados: ${verificados}
    ''';
  }
}
