import whisper


class GptTranscription:

    def __init__(self):
        self.model = whisper.load_model("medium")

    def transciption(self, file_path):
        # load audio and pad/trim it to fit 30 seconds
        # audio = whisper.load_audio(file_path)
        # audio = whisper.pad_or_trim(audio)
        # # make log-Mel spectrogram and move to the same device as the model
        # mel = whisper.log_mel_spectrogram(audio).to(self.model.device)
        # # decode the audio
        # options = whisper.DecodingOptions()
        # result = whisper.decode(self.model, mel, options)
        # # print the recognized text
        # print(result.text)
        result = self.model.transcribe(file_path)
        print(result["text"])
        return result["text"]

