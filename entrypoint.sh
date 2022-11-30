#!/bin/sh

python3 manage.py makemigrations  --noinput
python3 manage.py migrate  --noinput
python3 manage.py collectstatic --noinput
DJANGO_SUPERUSER_PASSWORD=mudar123 python3 manage.py createsuperuser --username=django_user --email=django@email.com --noinput
#28/11
#gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 main:app
gunicorn django_pi_v2.wsgi:application --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 #main:app
#gunicorn django_pi_v2.wsgi:application --bind 0.0.0.0:8000 
#gunicorn django_pi_v2.wsgi:application --env DJANGO_SETTINGS_MODULE='django_pi_v2.settings'--bind 0.0.0.0:8000 --password=$DJANGO_SUPER_USER_PASSWORD 