"""Flask app for dessert demo."""

from flask import Flask, request, jsonify
from flask_cors import CORS
from models import db, connect_db, User
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///friendr'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

connect_db(app)

@app.get("/")
def test():
    return "Running"

class UserView(Resource):
    def get(self):
        users = User.query.all()
        return jsonify(users=[u.serialize for u in users])

api.add_resource(UserView, '/users')


