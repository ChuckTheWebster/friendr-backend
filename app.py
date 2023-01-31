"""Flask app for dessert demo."""

from flask import Flask, request, jsonify
# from models import db, connect_db, Dessert

app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///desserts'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SQLALCHEMY_ECHO'] = True

# connect_db(app)

@app.get("/")
def test():
    return "Running"