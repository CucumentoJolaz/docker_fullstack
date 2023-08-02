# syntax=docker/dockerfile:1
FROM python:3
#EXPOSE 8088
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y gunicorn
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
COPY . .
#ENTRYPOINT ["python"]
#CMD ["manage.py", "runserver", "0.0.0.0:8088"]
