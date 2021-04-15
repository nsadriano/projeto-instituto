FROM python:alpine 

LABEL maintainer="Adriano Nascimento"

RUN pip install flask 

COPY src /src/

RUN chmod +x /src/entrypoint.sh

EXPOSE 80

#ENTRYPOINT ["python", "/src/app.py"]
ENTRYPOINT ["/src/entrypoint.sh"]
