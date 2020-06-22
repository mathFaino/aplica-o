from rest_framework.serializers import ModelSerializer
from paciente.models import Paciente


class PacienteSerializer(ModelSerializer):
    class Meta:
        model = Paciente
        fields = ('id', 'nome', 'CPF', 'data_nascimento', 'sus')
