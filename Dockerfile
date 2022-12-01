FROM python:3

ENV PYTHONUNBUFFERED True

# Copia código local para imagem do container

ENV DJANGO_PI_V2 /django_pi
WORKDIR $DJANGO_PI_V2
COPY . ./

#Instala dependência de produção
RUN pip install -r requirements.txt
RUN pip install Django gunicorn

CMD exec gunicorn django_pi_v2.wsgi:application --bind :$PORT --workers 1 --threads 8 --timeout 0 

#FROM python:3.8-slim-buster
#RUN python -m pip install --upgrade pip
#COPY ./requirements.txt .
#RUN pip install -r requirements.txt
#COPY ./django_pi_v2 /app
#WORKDIR /app

#COPY ./entrypoint.sh /
#ENTRYPOINT [ "sh", "/entrypoint.sh" ]


