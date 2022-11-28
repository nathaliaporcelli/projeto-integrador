#!/bin/sh

python3 manage.py makemigrations  --noinput
python3 manage.py migrate  --noinput
python3 manage.py collectstatic --noinput
DJANGO_SUPERUSER_PASSWORD=mudar123 python3 manage.py createsuperuser --username=django_user --email=django@email.com --noinput

gunicorn django_pi_v2.wsgi:application --preload --bind 0.0.0.0:8000 
#gunicorn django_pi_v2.wsgi:application --env DJANGO_SETTINGS_MODULE='django_pi_v2.settings'--bind 0.0.0.0:8000 --password=$DJANGO_SUPER_USER_PASSWORD 