# Generated by Django 3.0.3 on 2020-06-17 18:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('especialista', '0015_especialista_imagem_perfil'),
    ]

    operations = [
        migrations.AddField(
            model_name='especialista',
            name='nome',
            field=models.CharField(default='ame', max_length=100),
            preserve_default=False,
        ),
    ]