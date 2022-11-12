
FROM nginx:alpine
COPY . /usr/share/nginx/html
CMD ["gunicorn", "--bind", ":80", "--workers", "3", "django_pi_v2.wsgi:application"]
