FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask

COPY src /src/

EXPOSE 5000

ENTRYPOINT ["python", "/src/app.py", "&"]