from flask import Flask
import logging
import logging.handlers
import os
 
handler = logging.handlers.WatchedFileHandler(
    os.environ.get("LOGFILE", "/var/log/yourapp.log"))
formatter = logging.Formatter(logging.BASIC_FORMAT)
handler.setFormatter(formatter)
root = logging.getLogger()
root.setLevel(os.environ.get("LOGLEVEL", "INFO"))
root.addHandler(handler)
 
try:
    exit(main())
except Exception:
    logging.exception("Exception in main()")
    exit(1)

app = Flask(__name__)

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