from flask import Flask
import logging

log_format = '%(asctime)s:%(levelname)s:%(filename)s:%(message)s'

logging.basicConfig(filename='exemplo.log',
                    filemode='w',
                    level=logging.DEBUG,
                    format=log_format)

logger = logging.getLogger('root')


app = Flask(__name__)

@app.route("/")
def home() :
  logger.info("Codigo 200")
  return "<html>" + \
    "<head><title>Desafio Instituto Atlantico</title></head>" + \
    "<body>" + \
    "<h1>Hello World!</h1>" + \
    "</body>" + \
    "</html>"

if __name__ == "__main__":
    app.run(host = '0.0.0.0', port = 80)