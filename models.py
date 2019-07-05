import sqlite3
import os
import hmac
import random

ROOT = os.path.dirname(os.path.relpath(__file__))

def create_presenca(nome, email, code):
    conn = sqlite3.connect(os.path.join(ROOT, 'database.db'))
    cur = conn.cursor()
    cur.execute("INSERT INTO presencas (codigo_evento, nome, email) values (?, ?, ?)", (code, nome, email))
    conn.commit()
    conn.close()
    print("Presenca registrada:", nome)
    
def get_presencas():
    conn = sqlite3.connect(os.path.join(ROOT, 'database.db'))
    cur = conn.cursor()
    cur.execute("SELECT * FROM presencas")
    posts = cur.fetchall()
    return posts
