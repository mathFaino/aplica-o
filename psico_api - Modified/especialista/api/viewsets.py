from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import TokenAuthentication
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from especialista.models import Especialista
from .serializers import EspecialistaSerializer


class EspecialistaViewSet(ModelViewSet):
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)
    queryset = Especialista.objects.all()
    serializer_class = EspecialistaSerializer
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('usuario',)
