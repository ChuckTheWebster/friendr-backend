"""Flask app for dessert demo."""

from flask import Flask, request, jsonify
from flask_cors import CORS
from models import db, connect_db, User, Match
from sqlalchemy.exc import IntegrityError
from forms import (UserAddForm, UserLoginForm)
import uuid

import boto3
from dotenv import load_dotenv
import os
from werkzeug.utils import secure_filename

load_dotenv()

BUCKET_NAME = os.environ["BUCKET_NAME"]
BUCKET_URL = os.environ["BUCKET_URL"]

app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///friendr'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = os.environ['SECRET_KEY']

connect_db(app)

s3 = boto3.client(
    "s3",
    "us-west-1",
    aws_access_key_id=os.environ['aws_access_key_id'],
    aws_secret_access_key=os.environ['aws_secret_access_key']
)


def upload_image(path_to_file, bucket, filename, content_type):
    # TODO: Move to helpers

    upload_file_response = s3.put_object(Body=path_to_file,
                                         Bucket=bucket,
                                         Key=filename,
                                         ContentType=content_type
                                         )
    print(f" ** Response - {upload_file_response}")
    return f"{BUCKET_URL}/{filename}"


# ======================== AUTH VIEWS ===========================

@app.post('/auth/token')
def login():
    """Handle user login. Returns a token. """

    form = UserLoginForm()

    if form.validate_on_submit():
        user = User.authenticate(form.username.data, form.password.data)

        if user:
            token = User.create_token(user)
            return token

        return jsonify(error="Invalid username or password.")
    else:
        return jsonify(errors=form.errors)


@app.post('/auth/register')
def signup():
    """Handle user signup and returns a token. """

    form = UserAddForm()

    if form.validate_on_submit():
        file = form.file.data
        content_type = file.content_type
        extension = secure_filename(file.filename).split(".")[1]
        new_filename = f"{uuid.uuid4()}.{extension}"
        bucket = BUCKET_NAME
        file_url = upload_image(file, bucket, new_filename, content_type)

        try:
            user = User.signup(
                first_name=form.first_name.data,
                last_name=form.last_name.data,
                username=form.username.data,
                password=form.password.data,
                email=form.email.data,
                image_url=file_url,
                location=form.location.data,
                bio=form.bio.data,
                friend_radius=form.friend_radius.data
            )
            db.session.commit()

            token = User.create_token(user=user)

            return (jsonify(token=token), 201)
        except IntegrityError:
            return jsonify(error="User or email already taken.")
    else:
        return jsonify(erorrs=form.errors)


# ======================== Matches & Matcher Views ===========================


@app.get("/matcher/<username>")
def find_friends(username):
    """
    Finds users excluding currently logged in user.

    TODO:
        - Check currently logged in user matches username
    """
    current_user = User.query.filter_by(username=username).first()
    exclude_users_list = current_user.exclude_users_in_match
    exclude_users_list.append(str(current_user))

    users = User.query.filter(User.username.not_in(exclude_users_list))
    return jsonify(users=[u.serialize for u in users])


@app.get("/matches/<username>")
def list_matches(username):
    """ TODO: Show matches """

    current_user = User.query.get_or_404(username)
    matched_users = current_user.matches

    return jsonify(matches=[u.serialize for u in User.query.filter(User.username.in_(matched_users))])


@app.get('/users/<username>')
def get_user(username):
    user = User.query.get_or_404(username)

    return jsonify(user=user.serialize)


@app.post('/likes')
def like_or_dislike():
    data = request.get_json()
    # breakpoint()
    match = Match.createLikeStatus(
        u1=data["u1"], u2=data["u2"], is_liked=data["like_status"])
    print("match=", match)
    db.session.commit()
    return jsonify(status="ok")
