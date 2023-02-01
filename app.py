"""Flask app for dessert demo."""

from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
from models import db, connect_db, User
from flask import Flask
from flask_restful import Resource, Api
from sqlalchemy.exc import IntegrityError
from forms import (UserAddForm)
import uuid
from werkzeug.datastructures import MultiDict
from flask_wtf.csrf import CSRFProtect

import boto3
from dotenv import load_dotenv
import os
from werkzeug.utils import secure_filename
load_dotenv()  # take environment variables from .env.

# print(f"Bucket Name {BUCKET_NAME}")
BUCKET_NAME = os.environ["BUCKET_NAME"]
BUCKET_URL = os.environ["BUCKET_URL"]

app = Flask(__name__)
api = Api(app)
CORS(app)
csrf = CSRFProtect(app)
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


@app.get("/")
def test():
    return "Running"

class UserView(Resource):
    def get(self):
        users = User.query.all()
        return jsonify(users=[u.serialize for u in users])

api.add_resource(UserView, '/users')


@app.get("/upload")
def get_uploader():
    return render_template("uploader.html")


@app.post("/upload")
def upload_img():

    """
    TODO: Questions:
        1. Are we handling extensions correctly? Should we create a white list
           of allowed image extensions (ex: .jpg, .png)? Should we use a library
           that can figure out the real extension of the file by reading it first?
           Because anyone could rename the extension of a file to be something else.
           What would happen if someone were to give some python script file an
           extension of .png ?

           PIL verify()
           https://pillow.readthedocs.io/en/stable/reference/Image.html#PIL.Image.Image.verify

           OR

           from PIL import Image
            try:
                image = Image.open(filename)
                # do our uploading
            except IOError:
                # throw an error here that our file is not an image

        2. Should our content_type be "image/*"?
        3. Is there a better way to pass our bucket?
        4. Are we able to get the object url from the response?
           We're dynamically building it using a BUCKET_URL and the new
           file name.
    """

    file = request.files["profile_img"]
    content_type = file.content_type
    extension = secure_filename(file.filename).split(".")[1]
    new_filename = f"{uuid.uuid4()}.{extension}"

    bucket = BUCKET_NAME
    file_url = upload_image(file, bucket, new_filename, content_type)

    # TODO: save this to user model
    return f"{file_url}"

def upload_image(path_to_file, bucket, filename, content_type):
    # TODO: Move to helpers

    upload_file_response = s3.put_object(Body=path_to_file,
                                             Bucket=bucket,
                                             Key=filename,
                                             ContentType=content_type
                                             )
    print(f" ** Response - {upload_file_response}")
    return f"<img src='{BUCKET_URL}/{filename}' />"


@app.route('/signup', methods=["POST"])
@csrf.exempt
def signup():
    """Handle user signup.

    Create new user and add to DB. Redirect to home page.

    If form not valid, present form.

    If the there already is a user with that username: flash message
    and re-present form.
    """

    form = UserAddForm(MultiDict(request.get_json()),)
    breakpoint()
    #TODO Return token

    if form.validate_on_submit():
        try:
            user = User.signup(
                first_name=form.first_name.data,
                last_name=form.last_name.data,
                username=form.username.data,
                password=form.password.data,
                email=form.email.data,
                image_url=form.image_url.data,
                location=form.location.data,
                bio=form.bio.data,
                friend_radius=form.friend_radius.data
            )
            db.session.commit()

        except IntegrityError:
            pass

    else:
        pass
