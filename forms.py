from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, TextAreaField, IntegerField
from wtforms.validators import DataRequired, Email, Length, InputRequired


class CSRFProtection(FlaskForm):
    """CSRFProtection form, intentionally left blank."""

class UserAddForm(FlaskForm):
    """Form for adding users."""
    class Meta:
        csrf=False

    first_name = StringField('First Name', validators=[InputRequired()])
    last_name = StringField('Last Name', validators=[InputRequired()])
    username = StringField('Username', validators=[InputRequired()])
    email = StringField('E-mail', validators=[InputRequired(), Email()])
    password = PasswordField('Password', validators=[Length(min=6)])
    image_url = StringField('Image URL', validators=[InputRequired()])
    location = StringField('Zip Code', validators=[InputRequired()])
    bio = StringField('Bio')
    friend_radius = IntegerField('Match Radius')