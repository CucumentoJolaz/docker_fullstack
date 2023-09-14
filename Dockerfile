# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update && apt-get install -y gunicorn
RUN pip install -r requirements.txt
COPY . /code/
#CMD ["gunicorn"  , "--bind", "0.0.0.0:8000", "composeexample.wsgi:application"]