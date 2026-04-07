import pymysql
import os
from dotenv import load_dotenv
from flask import request, jsonify
import bcrypt
import jwt_utils


load_dotenv()  # .env 파일 읽기

def get_db():
    return pymysql.connect(
        host=os.getenv('MYSQL_HOST'),
        user=os.getenv('MYSQL_USER'),
        password=os.getenv('MYSQL_PASSWORD'),
        database=os.getenv('MYSQL_DATABASE')
    )

# 회원가입
def register():
    data = request.json         
    email = data['email']     
    password = data['password']
    nickname = data['nickname']

    conn = get_db()
    cursor = conn.cursor()
    hashed_pw = bcrypt.hashpw(password.encode(), bcrypt.gensalt())

    # 이메일 중복 확인
    cursor.execute("SELECT id FROM users WHERE email = %s", (email,))

    # 이메일 중복 시, 400 ERROR
    if cursor.fetchone():
        return jsonify({"error": "이미 존재하는 이메일입니다"}), 400

    # 회원 생성
    cursor.execute(
        "INSERT INTO users (email, password, nickname) VALUES (%s, %s, %s)",
        (email, hashed_pw, nickname)
    )
    conn.commit()

    return jsonify({"message" : "회원가입 성공"})

# 로그인
def login():
    data = request.json         
    email = data['email']     
    password = data['password']

    conn = get_db()
    cursor = conn.cursor()
    
    # 유저 조회
    cursor.execute(
        "SELECT id, password FROM users WHERE email = %s",
        (email,)
    )
    user = cursor.fetchone()

    # 유저 없는 경우, 400 ERROR
    if not user:
        return jsonify({"error" : "이메일 또는 비밀번호가 틀립니다."}), 400
    
    user_id, hashed_pw = user

    # pw bytes형으로 변환 후, 검증
    if isinstance(hashed_pw, str):
        hashed_pw = hashed_pw.encode()

    if not bcrypt.checkpw(password.encode(), hashed_pw):
        return jsonify({"error": "이메일 또는 비밀번호가 틀립니다"}), 400

    # 토큰 발급
    return jsonify({"message" : "로그인에 성공하였습니다.", "token" : jwt_utils.create_token(user_id)})