import json
import boto3
import os
 
dynamodb = boto3.resource("dynamodb")
 
table = dynamodb.Table(
    os.environ["TABLE_NAME"]
)
 
 
def lambda_handler(event, context):
 
    try:
 
        # HTTP API Gateway v2 sends the body as a string
        body = json.loads(event.get("body", "{}"))
 
        # Validate required fields
        student_id = body.get("id")
        student_name = body.get("name")
 
        if not student_id or not student_name:
 
            return {
                "statusCode": 400,
                "headers": {
                    "Content-Type": "application/json",
                    "Access-Control-Allow-Origin": "*",
                    "Access-Control-Allow-Headers": "*",
                    "Access-Control-Allow-Methods": "*"
                },
                "body": json.dumps({
                    "message": "Both id and name are required."
                })
            }
 
        student = {
            "id": student_id,
            "name": student_name
        }
 
        table.put_item(Item=student)
 
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
 
        print("ERROR:", str(e))
        print("EVENT:", json.dumps(event))
 
        return {
 
            "statusCode": 500,
 
            "headers": {
 
                "Content-Type": "application/json",
 
                "Access-Control-Allow-Origin": "*",
 
                "Access-Control-Allow-Headers": "*",
 
                "Access-Control-Allow-Methods": "*"
 
            },
 
            "body": json.dumps({
 
                "message": "Unable to save student.",
 
                "error": str(e)
 
            })
 
        }
 