# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 01:53
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0010_auto_20171110_0953'),
    ]

    operations = [
        migrations.RenameField(
            model_name='eventbase',
            old_name='eid',
            new_name='id',
        ),
    ]
