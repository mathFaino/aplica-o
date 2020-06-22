from rest_framework.serializers import ModelSerializer
from especialista.models import Especialista
from especialista_paciente.api.serializers import EspecialistaPacienteSerializer


class EspecialistaSerializer(ModelSerializer):

    atende = EspecialistaPacienteSerializer(read_only=True, many=True)

    class Meta:
        model = Especialista
        fields = ('id', 'nome', 'usuario'
                  ,'imagem_perfil'
                  , 'CRP', 'CRM', 'CPF', 'email', 'telefone', 'atende')

