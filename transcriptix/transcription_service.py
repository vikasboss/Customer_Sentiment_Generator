from flask import Flask, request, jsonify
from flask import Response
from DBQueries import MySqlHandler
import requests
from GptTranscription import GptTranscription
from subprocess import Popen, PIPE
# from celery import Celery
import threading
import uuid
import json

app = Flask(__name__)
# Flask app and flask-mail configuration truncated
gpt_transcription = GptTranscription()
db_handler = MySqlHandler()
flask_app = Flask(__name__)


def generate_transcription(callsid, file_path, callbackurl):
    print(f"Transcription generation for callsid ${callsid} started")
    transcription = gpt_transcription.transciption(file_path)
    db_handler.insert_call_transcription(callsid, transcription, callbackurl)
    requests.get(f"http://127.0.0.1:6000/call/{callsid}")
    print(f"Transcription generation for callsid ${callsid} completed")

@app.route("/api/transcription", methods=["POST"])
def transcription():
    callsid = request.form.get("callsid")
    callbackurl = request.form.get("callbackurl")
    binary_file = request.files.get("binary_file")
    file_path = f"audio_file_{callsid}.mp4"
    binary_file.save(file_path)
    t1 = threading.Thread(target=generate_transcription, args=(callsid, file_path, callbackurl,))
    t1.start()
    response = { "request_id": uuid.uuid4().hex, "method": "POST", "http_code": 202, "response": { "callsid": callsid} }
    return Response(json.dumps(response), status=202, mimetype='application/json') 

if __name__ == "__main__":
    app.run(debug=True)




