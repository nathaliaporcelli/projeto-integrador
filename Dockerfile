
FROM nginx:alpine
COPY . /usr/share/nginx/html
CMD ["gunicorn", "--bind", ":80", "--workers", "3", "django_pi_v2.wsgi:application"]
#CMD ["gunicorn","-b", "127.0.0.1:9000", "django_pi_v2.wsgi:application", "-w9", "-p /tmp/gunicorn_pi.pid"]
