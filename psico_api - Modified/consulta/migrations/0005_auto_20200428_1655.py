# Generated by Django 3.0.3 on 2020-04-28 20:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('analise_video', '0003_auto_20200428_1548'),
        ('consulta', '0004_auto_20200428_1638'),
    ]

    operations = [
        migrations.AlterField(
            model_name='consulta',
            name='analise_video',
            field=models.OneToOneField(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='analise_video.AnaliseVideo'),
        ),
    ]
