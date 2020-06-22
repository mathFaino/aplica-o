from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.viewsets import ModelViewSet
from analise_video.models import AnaliseVideo
from .serializers import AnaliseVideoSerializer, AnaliseVideoReadSerializer


class AnaliseVideoViewSet(ModelViewSet):
    # permission_classes = (IsAuthenticated,)
    # authentication_classes = (TokenAuthentication,)
    queryset = AnaliseVideo.objects.all()
    serializer_class = AnaliseVideoSerializer
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('possivel_depressao',)

    def get_serializer_class(self):
        actions = [
            'read'
        ]
        if self.action in actions:
            return AnaliseVideoReadSerializer
        return self.serializer_class
