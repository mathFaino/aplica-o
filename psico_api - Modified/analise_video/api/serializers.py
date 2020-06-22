from rest_framework import serializers
from analise_video.models import AnaliseVideo
import reconhece.reconhecer as reconhecer
from pathlib import Path


class AnaliseVideoSerializer(serializers.ModelSerializer):

    class Meta:
        model = AnaliseVideo
        fields = ('id', 'possivel_depressao', 'porcentagem_emocao1', 'porcentagem_emocao2',
                  'porcentagem_emocao3', 'data', 'video')
        write_only_fields = ['__all__']

    def create(self, validated_data):
        home = Path.cwd()
        caminho = str(home) + '/media_images/videos/'
        video = validated_data['video']
        video = video.split('videos')

        validated_data['video'] = None

        reconhecer_obj = reconhecer.Reconhecer(caminho + video[1])
        result = reconhecer_obj.realizar_reconhecimento()

        emocoes = self.top_three(result)
        print(emocoes)
        validated_data['porcentagem_emocao1'] = emocoes[0]
        validated_data['porcentagem_emocao2'] = emocoes[1]
        validated_data['porcentagem_emocao3'] = emocoes[2]

        if validated_data['porcentagem_emocao1'].find('Triste%'):
            validated_data['possivel_depressao'] = True
        else:
            validated_data['possivel_depressao'] = False
        analise_video = AnaliseVideo.objects.create(**validated_data)
        analise_video.save()
        return analise_video

    def top_three(self, map_sended):
        lista = []
        contador = 0
        pos = []
        lista_emotions = []
        while contador <= (len(map_sended) - 1):
            lista.append(float(map_sended[contador][1]))
            contador += 1
        original_list = lista.copy()
        lista.sort()
        tops = lista[-3:]
        q = sorted(tops, reverse=True)

        for a in q:
            print(a)
            pos.append(original_list.index(a))

        for b in pos:
            lista_emotions.append((map_sended[b][0] + ' ' + map_sended[b][1]))
        return lista_emotions


class AnaliseVideoReadSerializer(serializers.ModelSerializer):

    class Meta:
        model = AnaliseVideo
        fields = ('id', 'possivel_depressao', 'porcentagem_emocao1', 'porcentagem_emocao2',
                  'porcentagem_emocao3', 'data')
