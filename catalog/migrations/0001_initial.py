# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('comment', models.CharField(max_length=50, blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=50)),
                ('desc', models.CharField(max_length=255)),
                ('stock', models.PositiveIntegerField()),
                ('price', models.DecimalField(max_digits=10, decimal_places=2)),
            ],
        ),
        migrations.AddField(
            model_name='cart',
            name='items',
            field=models.ManyToManyField(to='catalog.Movie'),
        ),
        migrations.AddField(
            model_name='cart',
            name='user',
            field=models.ForeignKey(related_name='carts', to=settings.AUTH_USER_MODEL),
        ),
    ]
