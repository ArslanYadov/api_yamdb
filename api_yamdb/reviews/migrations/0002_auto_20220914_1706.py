# Generated by Django 2.2.16 on 2022-09-14 14:06

from django.db import migrations, models
import reviews.validators


class Migration(migrations.Migration):

    dependencies = [
        ('reviews', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='title',
            name='year',
            field=models.PositiveIntegerField(db_index=True, validators=[reviews.validators.validate_year], verbose_name='Год'),
        ),
    ]