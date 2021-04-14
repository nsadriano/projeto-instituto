from flask import Flask

from elasticapm.contrib.flask import ElasticAPM



app = Flask(__name__)
apm = ElasticAPM(app)


# or configure to use ELASTIC_APM in your application's settings
from elasticapm.contrib.flask import ElasticAPM
app.config['ELASTIC_APM'] = {
  # Set required service name. Allowed characters:
  # a-z, A-Z, 0-9, -, _, and space
  'SERVICE_NAME': '',

  # Use if APM Server requires a token
  'SECRET_TOKEN': '',

  # Set custom APM Server URL (default: http://localhost:8200)
  'SERVER_URL': 'http://apm-server:8200'
}

apm = ElasticAPM(app)


@app.route("/")
def home() :
   return "<html>" + \
           "<head><title>Desafio Instituto Atlantico</title></head>" + \
           "<body>" + \
               "<h1>Hello World!</h1>" + \
           "</body>" + \
           "</html>"

if __name__ == "__main__":
    app.run(host = '0.0.0.0', port = 80)