from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, IntegerField, FileField
from wtforms.validators import Email, Length, InputRequired


class UserAddForm(FlaskForm):
    """Form for adding users."""

    class Meta:
        csrf=False

    first_name = StringField('First Name', validators=[InputRequired()])
    last_name = StringField('Last Name', validators=[InputRequired()])
    username = StringField('Username', validators=[InputRequired()])
    email = StringField('E-mail', validators=[InputRequired(), Email()])
    password = PasswordField('Password', validators=[Length(min=6)])
    file = FileField('Select Image', validators=[InputRequired()])
    location = StringField('Zip Code', validators=[InputRequired()])
    bio = StringField('Bio')
    friend_radius = IntegerField('Match Radius')


class UserLoginForm(FlaskForm):
    """Form for logging in."""

    class Meta:
        csrf=False

    username = StringField('Username', validators=[InputRequired()])
    password = PasswordField('Password', validators=[Length(min=6)])

