import sqlite3
import os
import hmac
import random

ROOT = os.path.dirname(os.path.relpath(__file__))

def create_post(nome, local, data, hora):
    conn = sqlite3.connect(os.path.join(ROOT, 'database.db'))
    cur = conn.cursor()
    dig_maker=hmac.new(b'senha-segura')
    dig_maker.update(nome.encode()+local.encode()+data.encode()+hora.encode())
    codigo = dig_maker.hexdigest()
    cur.execute("INSERT INTO eventos (codigo, nome, local, data, hora) VALUES (?, ?, ?, ?, ?)", (codigo, nome, local, data, hora))
    conn.commit()
    conn.close()

def get_posts():
    conn = sqlite3.connect(os.path.join(ROOT, 'database.db'))
    cur = conn.cursor()
    cur.execute("SELECT * FROM eventos")
    posts = cur.fetchall()
    return posts
