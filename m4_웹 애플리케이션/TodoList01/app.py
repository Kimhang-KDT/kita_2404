from flask import Flask

app = Flask(__name__)
@app.route("/")
@app.route("/hello")
def test():                           
  return "Hello Flask!"

if __name__ == "__main__":              
    app.run(host="127.0.0.1", port="8080")