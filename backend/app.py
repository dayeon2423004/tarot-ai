from flask import Flask, request
from auth import register, login
from jwt_utils import check_auth
from claude import ask_llm

app = Flask(__name__)


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

    return ask_llm(message, user_id)


if __name__ == '__main__':
    app.run(debug=True)