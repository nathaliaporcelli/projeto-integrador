#!/bin/sh

python3 manage.py migrate
python3 manage.py collectstatic

DJANGO_SUPERUSER_PASSWORD=$SUPER_USER_PASSWORD python manage.py createsuperuser --username $SUPER_USER_NAME --email $SUPER_USER_EMAIL --noinput
#python manage.py createsuperuser --noinput
gunicorn django_pi_v2.wsgi:application --bind 0.0.0.0:8000