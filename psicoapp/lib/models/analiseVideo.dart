class AnaliseVideo {
  int id;
  bool possivelDepressao;
  String porcentagemEmocao1;
  String porcentagemEmocao2;
  String porcentagemEmocao3;
  String data;
  //Null video;

  AnaliseVideo(
      {this.id,
        this.possivelDepressao,
        this.porcentagemEmocao1,
        this.porcentagemEmocao2,
        this.porcentagemEmocao3,
        this.data,
        //this.video
      });

  AnaliseVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    possivelDepressao = json['possivel_depressao'];
    porcentagemEmocao1 = json['porcentagem_emocao1'];
    porcentagemEmocao2 = json['porcentagem_emocao2'];
    porcentagemEmocao3 = json['porcentagem_emocao3'];
    data = json['data'];
    //video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['possivel_depressao'] = this.possivelDepressao;
    data['porcentagem_emocao1'] = this.porcentagemEmocao1;
    data['porcentagem_emocao2'] = this.porcentagemEmocao2;
    data['porcentagem_emocao3'] = this.porcentagemEmocao3;
    data['data'] = this.data;
    //data['video'] = this.video;
    return data;
  }
}