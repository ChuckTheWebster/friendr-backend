"""Flask app for dessert demo."""

from flask import Flask, request, jsonify
from flask_cors import CORS
# from models import db, connect_db, Dessert

app = Flask(__name__)
CORS(app)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///desserts'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SQLALCHEMY_ECHO'] = True

# connect_db(app)

@app.get("/")
def test():
    return "Running"