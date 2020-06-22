from django.db import models
from especialista.models import Especialista
from paciente.models import Paciente


class EspecialistaPaciente(models.Model):
    especialista = models.ForeignKey(Especialista, related_name='atende', on_delete=models.CASCADE)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    hora = models.TimeField(auto_now_add=True)
    data = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.pk)
