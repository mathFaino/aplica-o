import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/key.dart';
import 'package:psicoapp/models/user.dart';
import 'package:http/http.dart' as http;

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{
  User user;
  Key key;

  @observable
  String usercredential = '';

  @observable
  bool _logado;

  @computed
  bool get logado => _logado;

  @action
  changeName(String value){
    usercredential = value;
  }
  @observable
  String password = '';

  @action
  changePass(String value){
    password = value;
  }

  @computed
  bool get verificaCampos {
    return (usercredential != '') && ((password != '') && (password.length >= 6));
  }

  @action
  entrar() {
    if(verificaCampos){
      print(usercredential);
      user = User(username: usercredential, pass: password );
      buscaToken().then((token){
        if(token.token != null){
          print(token.token);
          key = token;
          buscaUser().then((newUser){
             if(newUser != null){
               user = newUser;
               if(user.id != null){
                 print(user.id);
                 _logado = true;
               }else{
                 _logado = false;
               }
             }else{
               _logado = false;
             }
          });
        }else{
          _logado = false;
        }
      });
    }else{
      _logado = false;
    }
  }

  Future<Key> buscaToken() async{
    try{
      final response = await http.post(ConstsAPi.baseApiURL+'api-token-auth/', body: user.toJson());
      var decodedJson = jsonDecode(response.body);
      return Key.fromJson(decodedJson);
    }catch(_){
      print(_);
      return null;
    }
  }

  Future<User> buscaUser() async{
    try{
      final response = await http.get(ConstsAPi.baseApiURL+'user/?search=' + usercredential);
      var trueResponse = response.body;
      trueResponse = trueResponse.replaceAll('[', '');
      trueResponse = trueResponse.replaceAll(']', '');
      var decodedJson = jsonDecode(trueResponse);
      return User.fromJson(decodedJson);
    }catch(_){
      print(_);
      return null;
    }
  }
  //User usuario;
}