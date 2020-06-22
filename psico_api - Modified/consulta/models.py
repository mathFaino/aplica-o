from django.db import models
from paciente.models import Paciente
from especialista.models import Especialista
from analise_video.models import AnaliseVideo


class Consulta(models.Model):
    data = models.DateTimeField(auto_now_add=True)
    video = models.FileField(upload_to="videos", null=True, blank=True)
    relatorio = models.TextField(null=True, blank=True)
    sono_alterado = models.BooleanField(default=False)
    peso_alterado = models.BooleanField(default=False)
    apetite_alterado = models.BooleanField(default=False)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    especialista = models.ForeignKey(Especialista, on_delete=models.CASCADE)
    analise_video = models.OneToOneField(AnaliseVideo, on_delete=models.CASCADE, blank=True, null=True, editable=True,
                                         default=None)
    
    def __str__(self):
        return str(self.pk)
