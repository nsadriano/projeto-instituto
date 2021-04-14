from flask import Flask

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