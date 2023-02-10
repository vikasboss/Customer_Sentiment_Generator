from flask import Flask, request
from DBQueries import MySqlHandler
import requests
from GptTranscription import GptTranscription
from subprocess import Popen, PIPE
# from celery import Celery
import threading


app = Flask(__name__)
# Flask app and flask-mail configuration truncated
gpt_transcription = GptTranscription()
db_handler = MySqlHandler()

flask_app = Flask(__name__)
# flask_app.config.update(CELERY_CONFIG={
#     'broker_url': 'redis://localhost:6379',
#     'result_backend': 'redis://localhost:6379',
# })


# def make_celery(app):
#     celery = Celery(app.import_name)
#     celery.conf.update(app.config["CELERY_CONFIG"])

#     class ContextTask(celery.Task):
#         def __call__(self, *args, **kwargs):
#             with app.app_context():
#                 return self.run(*args, **kwargs)

#     celery.Task = ContextTask
#     return celery

# celery = make_celery(flask_app)


# @celery.task()
def process_data(callsid, file_path, callbackurl):
    f = open("output.txt", "a")
    print("gpt_transcription transciption")
    f.write("gpt_transcription transciption")
    f.close()
    transcription = gpt_transcription.transciption(file_path)
    print("transcription", transcription)
    f = open("output.txt", "a")
    print("gpt_transcription", transcription)
    f.write("transcription")
    f.close()
    db_handler.insert_call_transcription(callsid, transcription, callbackurl)
    requests.get(f"http://127.0.0.1:6000/call/{callsid}")



@app.route("/api/transcription", methods=["POST"])
def transcription():
    callsid = request.form.get("callsid")
    callbackurl = request.form.get("callbackurl")
    binary_file = request.files.get("binary_file")
    file_path = f"audio_file_{callsid}.mp4"
    binary_file.save(file_path)
    # process_data.delay(callsid, file_path, callbackurl)
    t1 = threading.Thread(target=process_data, args=(callsid, file_path, callbackurl,))
    t1.start()
    return {"status": 202, "message": "Accepted"}

if __name__ == "__main__":
    app.run(debug=True)




