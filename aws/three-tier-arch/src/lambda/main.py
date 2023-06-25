import pymysql
import os

def lambda_handler(event, context):
    # Database connection parameters
    db_host = os.environ['DB_HOST']
    db_user = os.environ['DB_USER']
    db_password = os.environ['DB_PASSWORD']
    db_name = os.environ['DB_NAME']

    try:
        # Attempt to establish a connection to the database
        conn = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_password,
            database=db_name,
            connect_timeout=5
        )

        # Connection successful
        conn.close()
        return {
            'statusCode': 200,
            'body': 'Database connection successful'
        }
    except Exception as e:
        # Connection failed
        return {
            'statusCode': 500,
            'body': f'Database connection failed: {str(e)}'
        }
