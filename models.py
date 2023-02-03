from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
import jwt


bcrypt = Bcrypt()
db = SQLAlchemy()


class User(db.Model):
    """User in the system."""

    __tablename__ = 'users'

    first_name = db.Column(
        db.Text,
        nullable=False
    )

    last_name = db.Column(
        db.Text,
        nullable=False
    )

    email = db.Column(
        db.Text,
        nullable=False,
        unique=True,
    )

    username = db.Column(
        db.Text,
        nullable=False,
        unique=True,
        primary_key=True,
    )

    location = db.Column(
        db.Text,
        nullable=False
    )

    friend_radius = db.Column(
        db.Integer,
        nullable=False,
        default=25
    )

    image_url = db.Column(
        db.Text,
        nullable=False
    )

    bio = db.Column(
        db.Text,
    )

    password = db.Column(
        db.Text,
        nullable=False,
    )

    def __repr__(self):
        return f"<User: {self.username}, {self.email}>"

    def __str__(self):
        return self.username

    @property
    def serialize(self):
        return {
            "username": self.username,
            "first_name": self.first_name,
            "bio": self.bio,
            "location": self.location,
            "image": self.image_url
        }

    @property
    def matches(self):
        # TODO: Fix this quick and dirty solution
        # incredibly terrible solution

        like = []
        liked_by = []

        matches = []

        users_I_like = Match.query.filter_by(
            user1_username=self.username,
            is_liked=True
        ).all()

        like += [match.user2_username for match in users_I_like]

        users_liked_by = Match.query.filter_by(
            user2_username=self.username,
            is_liked=True

        )

        liked_by += [match.user1_username for match in users_liked_by]

        for user in liked_by:
            if user in like:
                matches.append(user)

        return matches

    @property
    def exclude_users_in_match(self):
        """Exclude users in match or already seen."""

        results = []

        users_seen = Match.query.filter_by(
            user1_username=self.username
        ).all()

        results += [match.user2_username for match in users_seen]

        users_who_disliked = Match.query.filter_by(
            user2_username=self.username,
            is_liked=False
        )

        results += [match.user1_username for match in users_who_disliked]
        return results


    @classmethod
    def signup(cls, username, email, location, friend_radius, bio, password, first_name, last_name, image_url):
        """Sign up user.

        Hashes password and adds user to system.
        """

        hashed_pwd = bcrypt.generate_password_hash(password).decode('UTF-8')

        user = User(
            username=username,
            email=email,
            password=hashed_pwd,
            image_url=image_url,
            first_name=first_name,
            last_name=last_name,
            location=location,
            friend_radius=friend_radius,
            bio=bio,
        )

        db.session.add(user)
        return user

    @classmethod
    def create_token(cls, user):
        # TODO: import secret key instead of hard coding it
        payload = {"username": user.username}
        encoded_jwt = jwt.encode(payload, "adasdas", algorithm="HS256")
        print("encoded_jwt", encoded_jwt)
        return encoded_jwt

    @classmethod
    def authenticate(cls, username, password):
        """Find user with `username` and `password`.

        This is a class method (call it on the class, not an individual user.)
        It searches for a user whose password hash matches this password
        and, if it finds such a user, returns that user object.

        If this can't find matching user (or if password is wrong), returns
        False.
        """

        user = cls.query.filter_by(username=username).first()

        if user:
            is_auth = bcrypt.check_password_hash(user.password, password)
            if is_auth:
                return user

        return False


class Match(db.Model):

    __tablename__ = 'matches'

    user1_username = db.Column(
        db.Text,
        db.ForeignKey('users.username', ondelete="cascade"),
        primary_key=True,
    )

    user2_username = db.Column(
        db.Text,
        db.ForeignKey('users.username', ondelete="cascade"),
        primary_key=True,
    )

    is_liked = db.Column(
        db.Boolean,
        nullable=False
    )

    @classmethod
    def createLikeStatus(cls, u1, u2, is_liked):
        m = Match(
            user1_username=u1,
            user2_username=u2,
            is_liked=is_liked
        )
        db.session.add(m)
        db.session.commit()
        return m.user2_username


def connect_db(app):
    """Connect this database to provided Flask app.

    You should call this in your Flask app.
    """

    app.app_context().push()
    db.app = app
    db.init_app(app)
