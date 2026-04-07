import jwt
import datetime
import os
from flask import request, jsonify

SECRET_KEY = os.getenv("SECRET_KEY", "secret")

# 토큰 발급
def create_token(user_id):
    payload = {
        "user_id": user_id,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
    }

    token = jwt.encode(payload, SECRET_KEY, algorithm="HS256")
    return token

# 토큰 검증
def verify_token(token):
    try:
        return jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    except:
        return None
    
# 토큰 검증
def check_auth():
    auth_header = request.headers.get("Authorization")

    if not auth_header:
        return None, jsonify({"error": "토큰 없음"}), 401

    try:
        token = auth_header.split(" ")[1] # Bearer 제외 후
    except IndexError:
        return None, jsonify({"error": "토큰 형식 오류"}), 401

    decoded = verify_token(token)

    if not decoded:
        return None, jsonify({"error": "유효하지 않은 토큰"}), 401

    return decoded, None, None