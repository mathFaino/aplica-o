from rest_framework.viewsets import ModelViewSet
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from especialista_paciente.models import EspecialistaPaciente
from .serializers import EspecialistaPacienteSerializer, EspecialistaPacienteSerializerExistente


class EspecialistaPacienteViewSet(ModelViewSet):
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)
    queryset = EspecialistaPaciente.objects.all()
    serializer_class = EspecialistaPacienteSerializer

    # self.http_method_names['Post']

    def get_serializer_class(self):
        actions = [
            'create'
        ]
        objeto = 'paciente.nome'
        # print(self.request.data)
        # print(self.request.data.keys())
        # print('specialist' in self.request.data.dict().keys())
        if self.action in actions:
            if objeto in self.request.data.keys():
                return self.serializer_class
            return EspecialistaPacienteSerializerExistente
        return self.serializer_class
