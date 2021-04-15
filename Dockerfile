FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask \
&& pip install python-logstash-async

COPY src /src/

EXPOSE 80

ENTRYPOINT ["python", "/src/app.py"]