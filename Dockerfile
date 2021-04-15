FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask 

COPY src /src/

RUN cp /src/filebeat/filebeat /bin/filebeat \
&& filebeat -e -c /src/filebeat/filebeat.yml

EXPOSE 80

ENTRYPOINT ["python", "/src/app.py"]
