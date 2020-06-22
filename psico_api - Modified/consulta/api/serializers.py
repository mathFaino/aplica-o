
from rest_framework.serializers import ModelSerializer
from consulta.models import Consulta
from paciente.api.serializers import PacienteSerializer
from analise_video.api.serializers import AnaliseVideoSerializer


class ConsultaSerializer(ModelSerializer):
    paciente = PacienteSerializer(read_only=True)
    analise_video = AnaliseVideoSerializer()

    class Meta:
        model = Consulta
        fields = ('id', 'data', 'video', 'relatorio', 'sono_alterado', 'peso_alterado', 'apetite_alterado', 'paciente',
                  'especialista', 'analise_video')

    '''def create(self, validated_data):
        # del validated_data['analise_video']
        consulta = Consulta.objects.create(**validated_data)

        consulta.save()

        return consulta
    '''


class ConsultaSerializerCreate(ModelSerializer):

    class Meta:
        model = Consulta
        fields = ('id', 'data', 'video', 'relatorio', 'sono_alterado', 'peso_alterado', 'apetite_alterado', 'paciente',
                  'especialista', 'analise_video')
