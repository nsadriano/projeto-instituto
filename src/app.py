from flask import Flask

from logstash_async.handler import AsynchronousLogstashHandler
from logstash_async.formatter import FlaskLogstashFormatter

app = Flask(__name__)

LOGSTASH_HOST = "10.0.1.33"
LOGSTASH_TRANSPORT = "logstash_async.transport.BeatsTransport"
LOGSTASH_DB_PATH = "/home/app-data"
LOGSTASH_PORT = 9500

logstash_handler = AsynchronousLogstashHandler(
    LOGSTASH_HOST,
    LOGSTASH_PORT,
    database_path=LOGSTASH_DB_PATH,
    transport=LOGSTASH_TRANSPORT,
)

logstash_handler.formatter = FlaskLogstashFormatter(metadata={"beat": "Flask-app"})
app.logger.addHandler(logstash_handler)

@app.route("/")
def home() :
   app.logger.info("Hello there")
   return "<html>" + \
           "<head><title>Desafio Instituto Atlantico</title></head>" + \
           "<body>" + \
               "<h1>Hello World!</h1>" + \
           "</body>" + \
           "</html>"

if __name__ == "__main__":
    app.run(host = '0.0.0.0', port = 80)