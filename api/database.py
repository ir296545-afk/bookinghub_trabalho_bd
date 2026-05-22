import psycopg2

def get_connection():
    conn = psycopg2.connect(
        host="localhost",
        database="bookinghub",
        user="postgres",
        password="luisneto"
    )

    return conn