from flask import Flask
from flask import jsonify
from flask import request
from flask_cors import CORS, cross_origin
import socket

TCP_IP = '10.0.1.33'
TCP_PORT = 9500
BUFFER_SIZE = 20

app = Flask(__name__)
CORS(app)

@app.route("/")
def home() :
   s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((TCP_IP, TCP_PORT))
    s.send(request.method + " " + request.url + " " + "200")
    s.close()
   return "<html>" + \
           "<head><title>Desafio Instituto Atlantico</title></head>" + \
           "<body>" + \
               "<h1>Hello World!</h1>" + \
           "</body>" + \
           "</html>"

if __name__ == "__main__":
    app.run(host = '0.0.0.0', port = 80)