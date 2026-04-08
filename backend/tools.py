TOOLS = [
    {
        # 카드 뽑기 기능
        "name": "draw_tarot_card",
        "description": "타로 카드를 한 장 뽑습니다",
        "input_schema": {
            "type": "object",
            "properties": {}
        }
    },
    {
        # 기록 저장 기능
        "name": "save_record",
        "description": "사용자의 오늘 감정 기록을 저장합니다",
        "input_schema": {
            "type": "object",
            "properties": {
                "content": {"type": "string"},
                "emotion": {"type": "string", "description": "감지된 감정 (슬픔, 기쁨, 분노 등)"}
            },
            "required": ["content", "emotion"]
        }
    },
    {
        # 기록 조회 기능
        "name": "get_records",
        "description": "사용자의 과거 기록을 조회합니다",
        "input_schema": {
            "type": "object",
            "properties": {}
        }
    },
    {
        # 패턴 분석 기능 
        "name": "analyze_pattern",
        "description": "사용자의 감정 패턴을 분석합니다",
        "input_schema": {
            "type": "object",
            "properties": {}
        }
    }
    # {
    #     # 타로 보기
    #     "name": "draw_tarot_by_topic",
    #     "description": "사용자가 선택한 주제(연애, 금전, 진로 등)에 맞춰 타로 카드를 뽑고 해석합니다",
    #     "input_schema": {
    #         "type": "object",
    #         "properties": {
    #             "topic": {
    #                 "type": "string",
    #                 "description": "타로를 볼 주제 (연애, 금전, 진로 등)"
    #             }
    #         },
    #         "required": ["topic"]
    #     }
    # }
]