import json
import boto3
import os

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table(
    os.environ["TABLE_NAME"]
)


def lambda_handler(event, context):

    try:

        body = json.loads(event["body"])

        student = {

            "id": body["id"],

            "name": body["name"]

        }

        table.put_item(

            Item=student

        )

        return {

            "statusCode": 200,

            "headers": {

                "Content-Type": "application/json",

                "Access-Control-Allow-Origin": "*",

                "Access-Control-Allow-Headers": "*",

                "Access-Control-Allow-Methods": "*"

            },

            "body": json.dumps({

                "message": "Student saved successfully.",

                "student": student

            })

        }

    except Exception as e:

        return {

            "statusCode": 500,

            "headers": {

                "Access-Control-Allow-Origin": "*"

            },

            "body": json.dumps({

                "message": "Unable to save student.",

                "error": str(e)

            })

        }