import mysql.connector


class Connector:
    def __init__(self, sql):
        self.sql = sql

    def mysql_connect(self):
        result = None
        error = None
        DB_CONFIG = {
                "host": "127.0.0.1", "port": <port>,
                "user": "user", "password": "pwd",
                "database": "Chinook", "autocommit": True,
            }
        conn = mysql.connector.connect(**DB_CONFIG)
        try:
            cur = conn.cursor()
            cur.execute("USE `Chinook`;")
            cur.execute(self.sql)
            # Only fetch for read-only queries (this script enforces read-only anyway)
            rows = cur.fetchall() if cur.with_rows else []
            print(cur, rows)
            result = rows
        except mysql.connector.Error as err:
            #print(f"MySQL error: {err}")
            error = err
        finally:
            cur.close()
            conn.close()
        return result, error
