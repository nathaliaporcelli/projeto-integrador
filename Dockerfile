
FROM nginx:alpine
COPY . /usr/share/nginx/html
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "django_pi_v2.wsgi:application"]
