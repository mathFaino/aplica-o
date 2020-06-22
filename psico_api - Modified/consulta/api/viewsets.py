from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import TokenAuthentication
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from consulta.models import Consulta
from .serializers import ConsultaSerializer, ConsultaSerializerCreate


class ConsultaViewSet(ModelViewSet):
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)
    queryset = Consulta.objects.all()
    serializer_class = ConsultaSerializer
    filter_backends = (SearchFilter, DjangoFilterBackend)
    search_fields = ('data',)
    filter_fields = ('paciente', 'especialista')

    def get_serializer_class(self):
        actions = [
            'create',
            'update',
            'partial_update'
        ]
        if self.action in actions:
            return ConsultaSerializerCreate
        return self.serializer_class
