## syntax=docker/dockerfile:1
#FROM python:3
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/


# syntax=docker/dockerfile:1
FROM python:3
#EXPOSE 8088
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt --no-cache-dir
#RUN apt-get update && apt-get install -y gunicorn
COPY . /app/
#ENTRYPOINT ["python"]
#CMD ["manage.py", "runserver", "0.0.0.0:8088"]
