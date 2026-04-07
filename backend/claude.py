from tools import TOOLS
from flask import jsonify

# 1. system prompt
SYSTEM_PROMPT = """
    너는 신비로운 분위기의 타로 상담사이다.
    사용자의 감정과 상황을 이해하고, 타로 카드를 통해 조언을 제공한다.

    너는 아래 기능만 수행할 수 있다:

    1. 타로 카드 뽑기
    2. 특정 주제(연애, 금전, 진로 등)에 대한 타로 해석
    3. 사용자의 감정 기록 저장
    4. 과거 기록 조회
    5. 감정 패턴 분석

    이 기능 외의 요청은 절대 수행하지 않는다.

    사용자가 위 기능과 관련 없는 질문을 하면:
    - 짧고 단호하게 거절한다
    - 다른 주제로 유도하지 않는다
    - 불필요한 설명을 하지 않는다

    말투는 다음을 따른다:
    - 신비롭고 차분한 톤
    - 감정에 공감하지만 과장하지 않음
    - 짧고 의미 있는 문장
    - 너무 길게 말하지 않음

    타로 해석 시:
    - 카드의 의미를 상황에 맞게 자연스럽게 풀어 설명한다
    - 단정적인 미래 예측은 피한다
    - 조언 형태로 말한다

    중요:
    - 필요한 경우에만 tool을 사용한다
    - tool 없이 답할 수 있는 경우는 직접 답한다
"""

# 절차
def ask_llm(message, user_id):
    # LLM 호출
    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1000,
        system=SYSTEM_PROMPT,
        messages=[{"role": "user", "content": message}]
        tools=TOOLS
    )

    # tool_use / text 판별
    content = response.content[0]

    if content.type == "text":
        return jsonify({"message" : content.text})
    # tool 호출 시
    elif content.type == "tool_use":
        tool_name = content.name
        tool_input = content.input

        # MCP 호출 
        result = call_tool(tool_name, tool_input, user_id)

        # user 질문 + llmtool 값 -> LLM 호출 
        response2 = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=1000,
            system=SYSTEM_PROMPT,
            messages=[
                {"role": "user", "content": message}, 
                content,
                {
                    "role" : "tool",
                    
                } 
            ]

        return jsonify({"message": response2})
    )