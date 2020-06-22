from django.db import models


class Paciente(models.Model):
    nome = models.CharField(max_length=200)
    CPF = models.CharField(max_length=11)
    data_nascimento = models.DateField()
    sus = models.BigIntegerField()

    def __str__(self):
        return str(self.pk)
