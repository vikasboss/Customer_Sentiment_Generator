from flask import Flask, request
import openai
import mysql.connector
import requests
# Apply for an API key from OpenAI to use their GPT-3 model
openai.api_key = "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"
app = Flask(__name__)

def connect_to_database():
    return mysql.connector.connect(
        host="localhost",
        user="vikas",
        password="Vikas@12345",
        database="exotel",
        auth_plugin='mysql_native_password'
    )

@app.route('/call', methods=['POST'])
def create_call():
    callSid = request.form.get('callSid')
    transcription = request.form.get('transcription')
    summaryText = request.form.get('summaryText')
    sentiment = request.form.get('sentiment')

    conn = connect_to_database()
    cursor = conn.cursor()

    sql = "INSERT INTO Call (callSid, transcription, summaryText, sentiment) VALUES (%s, %s, %s, %s)"
    values = (callSid, transcription, summaryText, sentiment)

    cursor.execute(sql, values)
    conn.commit()

    return "Call created successfully", 201

@app.route('/call/<callSid>', methods=['GET'])
def read_call(callSid):
    conn = connect_to_database()
    cursor = conn.cursor()

    sql = "SELECT transcription FROM CallDB WHERE callSid = %s"
    values = (callSid,)

    cursor.execute(sql, values)
    result = cursor.fetchone()
    transcription =result[0]
    model_engine = "text-davinci-002"
    prompt = "Please summarize the following text: \n" + result[0] + "\nSummary: "

    # Generate a summary
    completions = openai.Completion.create(
        engine=model_engine,
        prompt=prompt,
        max_tokens=2048,
        n=1,
        stop=None,
        temperature=0.5,
    )

    # Get the first completion
    message = completions.choices[0].text
    summaryText = message

    # Print the summary
    print(message)

    # Define the model and prompt to generate a sentiment analysis score
    model_engine = "text-davinci-002"
    prompt = "Please perform sentiment analysis on the following text and generate a score on a scale of 1 to 10: \n" + result[0] + "\nScore: "

    # Generate a sentiment analysis score
    completions = openai.Completion.create(
        engine=model_engine,
        prompt=prompt,
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.5,
    )

    # Get the first completion
    message = completions.choices[0].text
    sentiment = convert_to_int(message)

    # Print the sentiment analysis score
    print(message)



    conn = connect_to_database()
    cursor = conn.cursor()
    

    
    cursor.execute("UPDATE CallDB SET summaryText = %s, sentiment = %s WHERE callSid = %s",(summaryText, int(sentiment), callSid))
    conn.commit()
    cursor.close()
    conn.close()
    url = "https://webhook.site/127d4c42-51b1-45c8-9f71-5ad4c62332f1"
    payload = {
        "callsid": callSid,
        "transcription": transcription,
        "summary": summaryText,
        "sentiment": sentiment
    }
    headers = {
        "Content-Type": "application/json"
    }
    response = requests.post(url, json=payload, headers=headers)
    if response.status_code == 200:
        message = "Hit sent successfully"
    else:
        message = "Hit sending failed"
    return message


def convert_to_int(string):
    try:
        return int(string)
    except ValueError:
        return_value = 0
        for character in string:
            try:
                return_value = return_value * 10 + int(character)
            except ValueError:
                pass
        return return_value

#    return str(result), 200


if __name__ == '__main__':
    app.run(host="localhost",port=6000)
