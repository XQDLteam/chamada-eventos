from flask import Flask, render_template, request
from models import create_post, get_posts

app = Flask(__name__)

@app.route('/', methods=["GET", "POST"])
def index():
    if request.method == "GET":
        pass
    
    if request.method == "POST":
        nome = request.form.get("nome")
        local = request.form.get("local")
        data = request.form.get("data")
        hora = request.form.get("hora")
        create_post(nome,local,data,hora)
    eventos = get_posts()
    return render_template("index.html", eventos=eventos)


if __name__ == "__main__":
    app.run(debug=True)
