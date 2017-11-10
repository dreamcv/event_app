# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 01:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0007_auto_20171110_0916'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stat',
            name='event_time',
        ),
        migrations.AddField(
            model_name='eventdetail',
            name='event_time',
            field=models.DateTimeField(auto_now=True, verbose_name='事件状态时间'),
        ),
    ]
