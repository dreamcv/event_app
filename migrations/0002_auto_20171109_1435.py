# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-09 06:35
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='stat',
            name='connect_person',
            field=models.ManyToManyField(blank=True, to=settings.AUTH_USER_MODEL, verbose_name='状态参与人员'),
        ),
    ]