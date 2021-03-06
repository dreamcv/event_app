# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-09 07:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0003_auto_20171109_1517'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='port',
            field=models.CharField(default='443', max_length=20, verbose_name='端口'),
        ),
        migrations.AddField(
            model_name='event',
            name='to_server',
            field=models.CharField(default='0.0.0.0', max_length=20, verbose_name='流向IP'),
        ),
        migrations.AlterField(
            model_name='event',
            name='event_cate',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='event.EventCate', verbose_name='数据类型'),
        ),
        migrations.AlterField(
            model_name='event',
            name='event_src',
            field=models.CharField(default='0.0.0.0', max_length=20, verbose_name='泄露源'),
        ),
    ]
