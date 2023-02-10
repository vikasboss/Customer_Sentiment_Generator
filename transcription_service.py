from flask import Flask, request
from DBQueries import MySqlHandler
import requests
from GptTranscription import GptTranscription

app = Flask(__name__)

gpt_transcription = GptTranscription()
db_handler = MySqlHandler()


@app.route("/api/transcription", methods=["POST"])
def transcription():
    callsid = request.form.get("callsid")
    callbackurl = request.form.get("callbackurl")
    binary_file = request.files.get("binary_file")
    file_path = f"audio_file_{callsid}.mp4"
    binary_file.save(file_path)
    print("gpt_transcription transciption")
    transcription = gpt_transcription.transciption(file_path)
    print("transcription", transcription)
    db_handler.insert_call_transcription(callsid, transcription, callbackurl)
    requests.get(f"http://127.0.0.1:6000/call/{callsid}")
    return {"status": 202, "message": "Accepted"}

if __name__ == "__main__":
    app.run(debug=True)