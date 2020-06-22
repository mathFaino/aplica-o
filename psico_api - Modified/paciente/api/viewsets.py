from rest_framework.authentication import TokenAuthentication
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from paciente.models import Paciente
from .serializers import PacienteSerializer


class PacienteViewSet(ModelViewSet):
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)
    queryset = Paciente.objects.all()
    serializer_class = PacienteSerializer
    filter_backends = (SearchFilter,)
    search_fields = ('CPF',)