import pymysql
from auth import get_db

def call_tool(tool_name, tool_input, user_id):
    db = get_db()
    cursor = db.cursor(pymysql.cursors.DictCursor) # 딕셔너리 접근
    
    # 타로 전체 반환
    if tool_name == "draw_tarot_card":
        cursor.execute("SELECT * FROM tarot_cards ORDER BY RAND() LIMIT 1")
        card = cursor.fetchone()

        return {
            "name": card["name"],
            "image_url": card["image_url"],
            "upright": card["upright_meaning"],
            "reverse": card["reverse_meaning"]
        }

    # 기록 저장
    elif tool_name == "save_record":
        content = tool_input.get("content")
        emotion = tool_input.get("emotion")

        cursor.execute(
            "INSERT INTO daily_records (user_id, content, emotion) VALUES (%s, %s, %s)",
            (user_id, content, emotion)
        )
        db.commit()

        return {
            "result": "기록이 저장되었습니다.",
            "image_url": None
        }

    # 기록 조회 
    elif tool_name == "get_records":
        # 최근 기록 5개 조회
        cursor.execute(
            "SELECT content, created_at FROM daily_records WHERE user_id=%s ORDER BY created_at DESC LIMIT 5",
            (user_id,)
        )
        records = cursor.fetchall()

        return {
            "result": records,
            "image_url": None
        }
        
    # 패턴 분석
    elif tool_name == "analyze_pattern":
        cursor.execute(
            "SELECT content FROM daily_records WHERE user_id=%s ORDER BY created_at DESC LIMIT 15",
            (user_id,)
        )
        records = cursor.fetchall()
        texts = [r["content"] for r in records]

        return {
            "result": texts,
            "image_url": None
        }

    # 타로 보기
    elif tool_name == "draw_tarot_by_topic":
        pass
    
    # 항상 dict로 반환
    return {
        "result": "알 수 없는 tool",
        "image_url": None 
    }