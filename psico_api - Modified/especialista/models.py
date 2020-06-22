from django.db import models
from django.contrib.auth.models import User
from paciente.models import Paciente


class Especialista(models.Model):
    nome = models.CharField(max_length=100)
    CRP = models.CharField(max_length=8, null=True, blank=True)
    CRM = models.CharField(max_length=10, null=True, blank=True)
    CPF = models.CharField(max_length=11)
    email = models.CharField(max_length=200)
    telefone = models.BigIntegerField()
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    paci = models.ManyToManyField(Paciente)
    imagem_perfil = models.FileField(upload_to='imagens', null=True, blank=True)

    def __str__(self):
        return str(self.pk)
        #if (self.CRP == "") or (self.CRP is None):
        #   return self.CRM
        # else:
        #    return self.CRP


