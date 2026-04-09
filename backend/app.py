from flask import Flask, request, jsonify
from auth import register, login
from jwt_utils import check_auth
from claude import ask_llm
from flask import render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('login.html')

@app.route('/auth/register', methods=['POST'])
def register_route():
    return register()

@app.route('/auth/login', methods=['POST'])
def login_route():
    return login()

@app.route('/chat', methods=['POST'])
def chat_route():
    user, error_response, status = check_auth()
    if error_response:
        return error_response, status
    
    user_id = user["user_id"]
    message = request.json.get("message")
    result = ask_llm(message, user_id)

    return jsonify({"message": result["text"], "image_url": result["image_url"]})

@app.route('/chat.html')
def chat_page():
    return render_template('chat.html')

if __name__ == '__main__':
    app.run(debug=True)