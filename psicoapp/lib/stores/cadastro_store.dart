import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/especialista.dart';
import 'package:psicoapp/models/user.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  final picker = ImagePicker();
  User user;
  Especialista especialista;

  @observable
  File _image;

  @action
  Future selectImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
  }

  @computed
  File get getImage => _image;

  @observable
  String _nome = '';

  @action
  changeName(String value) {
    _nome = value;
  }

  @observable
  String _email = '';

  @action
  changeMail(String value) {
    _email = value;
  }

  @observable
  String _crp = '';

  @action
  changeCrp(String value) {
    _crp = value;
  }

  @observable
  String _crm = '';

  @action
  changeCrm(String value) {
    _crm = value;
  }

  @observable
  String _cpf = '';

  @action
  changeCpf(String value) {
    _cpf = value;
  }

  @observable
  String _telefone = '';

  @action
  changePhone(String value) {
    _telefone = value;
  }

  @observable
  String _username = '';

  @action
  changeUsername(String value){
    _username = value;
  }

  @observable
  String _password = '';

  @action
  changePassword(String value){
    _password = value;
  }

  @computed
  bool get verificados{
    if((_password != '' && _password.length >= 6 )&& (_username != '') &&
        (_cpf != '' && _cpf.length == 11) && (_crp != '' || _crm != '') &&
        (_email.contains('@') && _email.contains('.com') && (_nome != '') && (_image != null)) ){
      return true;
    }else{
      return false;
    }
  }
  @observable
  bool cadastrado;

  @action
  cadastrar(){
    if(verificados){
      user = User(pass: _password, username: _username);
      criarUser().then((newUser){
        print('User:');
        print(newUser.username);
        especialista = Especialista(nome: _nome, email: _email, crm: _crm,
            crp: _crp, cpf: _cpf, usuario: newUser.id );
        criarEspecialista().then((status){
          if(status == 201){
            cadastrado = true;
          }else{
            cadastrado = false;
          }
        });
      });
    }else{
      cadastrado = false;
    }
  }

  Future<User> criarUser() async{
    try{
      final response = await http.post(ConstsAPi.baseApiURL+'user/', body: user.toJson());
      var decodedJson = jsonDecode(response.body);
      return User.fromJson(decodedJson);
    }catch(_){
      print(_);
      return null;
    }
  }
  Future<int> criarEspecialista() async{
    var postUri = Uri.parse(ConstsAPi.baseApiURL+'especialista/');
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['nome'] = especialista.nome;
    request.fields['email'] = especialista.email;
    request.fields['CRP'] = especialista.crp;
    request.fields['CRM'] = especialista.crm;
    request.fields['CPF'] = especialista.cpf;
    request.fields['telefone'] = especialista.cpf;
    request.fields['usuario'] = especialista.usuario.toString();
    request.files.add(await http.MultipartFile.fromPath(
      'imagem_perfil',
      _image.path,
      contentType: MediaType('image', 'jpg'),
    ));

    final result = await request.send();
    return result.statusCode;
  }


}