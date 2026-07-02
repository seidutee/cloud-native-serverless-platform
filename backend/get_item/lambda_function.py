import json
import boto3
import os
from decimal import Decimal

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table(
    os.environ["TABLE_NAME"]
)


class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return super().default(obj)


def lambda_handler(event, context):

    try:

        response = table.scan()

        students = response.get("Items", [])

        return {
            "statusCode": 200,

            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Headers": "*",
                "Access-Control-Allow-Methods": "*"
            },

            "body": json.dumps(
                students,
                cls=DecimalEncoder
            )
        }

    except Exception as e:

        return {

            "statusCode": 500,

            "headers": {
                "Access-Control-Allow-Origin": "*"
            },

            "body": json.dumps({

                "message": "Unable to retrieve students.",

                "error": str(e)

            })

        }