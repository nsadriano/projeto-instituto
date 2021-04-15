FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask 

COPY src /src/

EXPOSE 80

ENTRYPOINT ["python", "/src/app.py"]