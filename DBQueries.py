from mysql.connector import Error
from mysql.connector import pooling

class MySqlHandler:

    def __init__(self):
        try:
            connection_pool = pooling.MySQLConnectionPool(pool_name="pool",
                                                        pool_size=5,
                                                        pool_reset_session=True,
                                                        host='localhost',
                                                        database='exotel',
                                                        user='vikas',
                                                        password='Vikas@12345',
                                                        auth_plugin='mysql_native_password'
                                                        )

            # Get connection object from a pool
            self.connection_object = connection_pool.get_connection()

            if self.connection_object.is_connected():
                db_Info = self.connection_object.get_server_info()
                print("Connected to MySQL database using connection pool ... MySQL Server version on ", db_Info)

                cursor = self.connection_object.cursor()
                cursor.execute("select database();")
                record = cursor.fetchone()
                print("Your connected to - ", record)

        except Error as e:
            print("Error while connecting to MySQL using Connection pool ", e)
        finally:
            # closing database connection.
            if self.connection_object.is_connected():
                cursor.close()

    def insert_call_transcription(self, callsid, transcription, callbackurl):
        cursor = self.connection_object.cursor()
        cursor.execute(f"INSERT INTO CallDB (callSid ,transcription, callbackurl) VALUES (%s, %s, %s)", (callsid, transcription, callbackurl))
        self.connection_object.commit()
        cursor.close()