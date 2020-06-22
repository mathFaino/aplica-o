from rest_framework.serializers import ModelSerializer
from especialista_paciente.models import EspecialistaPaciente
from paciente.api.serializers import PacienteSerializer
from paciente.models import Paciente


class EspecialistaPacienteSerializer(ModelSerializer):
    paciente = PacienteSerializer()

    class Meta:
        model = EspecialistaPaciente
        fields = ('especialista', 'paciente', 'hora', 'data')

    def create(self, validated_data):
        paciente = validated_data['paciente']
        # del validated_data['paciente']
        print(validated_data)

        paci = Paciente.objects.create(**paciente)

        validated_data['paciente'] = paci

        # validated_data = {'paciente': paci}

        especialista_paciente = EspecialistaPaciente.objects.create(**validated_data)

        # especialista_paciente.paciente = paci.id

        especialista_paciente.save()

        return especialista_paciente


class EspecialistaPacienteSerializerExistente(ModelSerializer):
    class Meta:
        model = EspecialistaPaciente
        fields = ('especialista', 'paciente', 'hora', 'data')
