from flask import Flask, render_template, request
from models import create_presenca, get_presencas

app = Flask(__name__)

@app.route('/', methods=["GET", "POST"])
def index():
    if request.method == "GET":
        pass
    
    if request.method == "POST":
        nome = request.form.get("nome")
        email = request.form.get("email")
        code = request.form.get("code")
        create_presenca(nome, email, code)
        
    presencas = get_presencas()
    return render_template("index.html", presencas=presencas)


if __name__ == "__main__":
    app.run(debug=True)
