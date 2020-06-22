"""psico_api URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.conf.urls import include
from django.urls import path
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.authtoken.views import obtain_auth_token
from consulta.api.viewsets import ConsultaViewSet
from analise_video.api.viewsets import AnaliseVideoViewSet
from paciente.api.viewsets import PacienteViewSet
from especialista.api.viewsets import EspecialistaViewSet
from especialista_paciente.api.viewsets import EspecialistaPacienteViewSet
from especialista.api.userViewset import UserViewSet


router = routers.DefaultRouter()
router.register('consulta', ConsultaViewSet)
router.register('analise_video', AnaliseVideoViewSet)
router.register('paciente', PacienteViewSet)
router.register('especialista', EspecialistaViewSet)
router.register('especialistaPaciente', EspecialistaPacienteViewSet)
router.register('user', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('api-token-auth/', obtain_auth_token),
    path('admin/', admin.site.urls),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
