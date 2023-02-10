import whisper


class GptTranscription:

    def __init__(self):
        self.model = whisper.load_model("medium")

    def transciption(self, file_path):
        result = self.model.transcribe(file_path)
        return result["text"]

