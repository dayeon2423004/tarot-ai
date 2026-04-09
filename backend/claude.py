from tools import TOOLS
from call_tool import call_tool
import os
from anthropic import Anthropic

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

    타로 해석 및 카드 뽑은 후:
    - 역방향인지, 정방향 중 한가지를 골라 그에 대해 설명한다. 
    - 카드의 의미를 상황에 맞게 자연스럽게 풀어 설명한다
    - 단정적인 미래 예측은 피한다
    - 조언 형태로 말한다

    중요:
    - 필요한 경우에만 tool을 사용한다
    - tool 없이 답할 수 있는 경우는 직접 답한다

    - 사용자의 감정이 포함된 경우 반드시 다음 순서를 따른다:
        1. save_record tool 호출
        2. draw_tarot_card tool 호출
        3. tool 결과를 기반으로 반드시 최종 해석 응답을 생성한다

    - tool을 호출했을 경우, 반드시 tool 결과를 이용해 최종 답변까지 생성해야 한다.
    - 절대 tool 호출만 하고 응답을 끝내지 않는다.
"""

# 절차
def ask_llm(message, user_id):
    client = Anthropic(api_key=os.getenv("MODEL_KEY"))

    # LLM 호출
    response = client.messages.create(
        # model="claude-sonnet-4-6",
        model = "claude-sonnet-4-20250514",
        max_tokens=1000,
        system=SYSTEM_PROMPT,
        messages=[{"role": "user", "content": message}],
        tools=TOOLS
    )

    # multi tool + tool_use / text 판별
    tool_results = []
    text_response = None
    for item in response.content:
        if item.type == "text":
            text_response = item.text
        
        elif item.type == "tool_use":
            result = call_tool(item.name, item.input, user_id)

            tool_results.append({
                "tool_use_id" : item.id,
                "result": result
            })

    # tool 없는 경우
    if not tool_results:
        return {
            "text": text_response,
            "image_url": None
        }
    
    # LLM 전달할 메세지 저장
    messages = [
        {"role": "user", "content": message},
        {"role": "assistant", "content": response.content}
    ]

    # tool 메세지
    tool_result_contents = [
        {
            "type": "tool_result",
            "tool_use_id": tool["tool_use_id"],
            "content": str(tool["result"])
        }

        for tool in tool_results
    ]

    messages.append({
        "role": "user",
        "content": tool_result_contents 
    })

    # user 질문 + llm 전 요청 값 + tool 값 -> LLM 호출 
    response2 = client.messages.create(
        # model="claude-sonnet-4-6",
        model="claude-sonnet-4-20250514",
        max_tokens=1000,
        system=SYSTEM_PROMPT,
        messages=messages
    )

    # URL 반환
    image_url = None
    for tool in tool_results:
        if tool["result"].get("image_url"):
            image_url = tool["result"]["image_url"]
            break

    # content에서 text 찾아 메세지 전달
    final_text = None
    for item in response2.content:
        if item.type == "text":
            final_text = item.text
            break
        if not final_text:
            final_text = "응답을 생성하지 못했습니다."

    return {
        "text": final_text,
        "image_url": image_url
    }
