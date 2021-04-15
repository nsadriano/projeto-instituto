FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask \
&& pip install python-logstash-async \
&& pip install -U flask-cors

COPY src /src/

EXPOSE 80

ENTRYPOINT ["python", "/src/app.py"]