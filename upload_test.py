import os
import dotenv
import boto3
from dotenv import load_dotenv

BASE_URL="https://chucket.s3.us-west-1.amazonaws.com"

load_dotenv()  # take environment variables from .env.

s3 = boto3.client(
    "s3",
    "us-west-1",
    aws_access_key_id=os.environ['aws_access_key_id'],
    aws_secret_access_key=os.environ['aws_secret_access_key']
)

for bucket in s3.list_buckets():
    print(bucket)

objects = s3.list_objects_v2(Bucket="chucket")

for obj in objects["Contents"]:
    print(obj["Key"])

s3.upload_file("./test.txt", "chucket", "chuck.txt")

test = s3.get_object(Bucket="chucket", Key="chuck.txt")
print(test["Body"].read())

profile_image = f"{BASE_URL}/image.png"
print(profile_image)