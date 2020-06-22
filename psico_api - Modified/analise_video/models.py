from django.db import models


class AnaliseVideo(models.Model):
    possivel_depressao = models.BooleanField(default=False, null=True, blank=True)
    porcentagem_emocao1 = models.CharField(max_length=50, null=True, blank=True)
    porcentagem_emocao2 = models.CharField(max_length=50, null=True, blank=True)
    porcentagem_emocao3 = models.CharField(max_length=50, null=True, blank=True)
    data = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    video = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        return str(self.pk)
