
FROM python:3.8-slim-buster
RUN python -m pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY ./django_pi_v2 /app
WORKDIR /app

COPY ./entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]


#CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "django_pi_v2.wsgi:application"]
CMD ["gunicorn","-b", "127.0.0.1:8000", "django_pi_v2.wsgi:application", "-w9", "-p /tmp/gunicorn_pi.pid"]
