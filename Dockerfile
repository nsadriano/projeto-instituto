FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask 

COPY src /src/

ENV FILEBEAT_VERSION=6.1.1

RUN apk add --update-cache curl bash libc6-compat && \
    rm -rf /var/cache/apk/* && \
    curl https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz -o /filebeat.tar.gz && \
    tar xzvf filebeat.tar.gz && \
    rm filebeat.tar.gz && \
    mv filebeat-${FILEBEAT_VERSION}-linux-x86_64 filebeat && \
    cd filebeat && \
    cp filebeat /usr/bin && \
    rm -rf /filebeat/filebeat.yml

RUN filebeat -e -c /src/filebeat/filebeat.yml

EXPOSE 80

ENTRYPOINT ["python", "/src/app.py"]
