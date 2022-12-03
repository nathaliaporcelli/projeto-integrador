
FROM python:3.8-slim-buster
RUN python -m pip install --upgrade pip
COPY ./requirements.txt .
COPY ./Dockerfile .
RUN pip install -r requirements.txt
COPY ./django_pi_v2 /app
WORKDIR /app

COPY ./entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]



