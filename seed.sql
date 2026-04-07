-- 타로 카드 78장 시드 데이터
-- 메이저 아르카나 22장 + 마이너 아르카나 56장
-- cd Users\YJU\Desktop\tarot-ai
-- docker exec -it tarot_db mysql -u tarot_user -ptarotpassword1234 tarot_db -e "SET FOREIGN_KEY_CHECKS=0; TRUNCATE TABLE tarot_cards; SET FOREIGN_KEY_CHECKS=1;"
-- docker exec -i tarot_db mysql -u tarot_user -ptarotpassword1234 --default-character-set=utf8mb4 tarot_db < seed.sql

INSERT INTO tarot_cards (name, image_url, upright_meaning, reverse_meaning) VALUES
-- =====================
-- 메이저 아르카나 (22장)
-- =====================
('바보 (The Fool)', '/images/tarot/major/0. 바보 카드.jpg',
 '새로운 시작, 순수한 열정, 자유로운 모험, 무한한 가능성, 즉흥성',
 '무모함, 무책임, 경솔한 판단, 위험한 도전, 어리석음'),

('마법사 (The Magician)', '/images/tarot/major/1. 마법사 카드.jpg',
 '강한 의지력, 창조적 능력, 집중력, 기술과 재능, 목표 실현',
 '재능 낭비, 속임수, 의욕 상실, 잠재력 미발휘, 조작'),

('여사제 (The High Priestess)', '/images/tarot/major/2. 여사제 카드.jpg',
 '직관력, 내면의 지혜, 신비로움, 잠재의식, 고요한 통찰',
 '비밀, 표면적 지식, 직관 무시, 내면의 혼란, 억압된 감정'),

('여황제 (The Empress)', '/images/tarot/major/3. 여황제 카드.jpg',
 '풍요, 모성애, 창조성, 자연과의 조화, 번영과 성장',
 '창의력 부족, 의존성, 과잉 보호, 불임, 낭비'),

('황제 (The Emperor)', '/images/tarot/major/4. 황제 카드.jpg',
 '권위, 안정, 리더십, 구조와 질서, 보호와 통제',
 '독재, 경직성, 지나친 통제, 권력 남용, 부성 결핍'),

('교황 (The Hierophant)', '/images/tarot/major/5. 교황 카드.jpg',
 '전통, 종교적 믿음, 도덕성, 교육, 관습과 규범',
 '독단주의, 전통 거부, 반항, 불필요한 규칙, 편협함'),

('연인 (The Lovers)', '/images/tarot/major/6. 연인 카드.jpg',
 '사랑, 조화, 가치관 정립, 중요한 선택, 진실한 관계',
 '불화, 잘못된 선택, 가치관 혼란, 불균형, 이별'),

('전차 (The Chariot)', '/images/tarot/major/7. 전차 카드.jpg',
 '승리, 의지력, 결단력, 자기 통제, 목표를 향한 전진',
 '통제력 상실, 공격성, 방향 상실, 좌절, 충동적 행동'),

('힘 (Strength)', '/images/tarot/major/8. 힘 카드.jpg',
 '내면의 힘, 용기, 인내, 자기 절제, 열정과 이성의 균형',
 '자기 의심, 나약함, 두려움, 에너지 고갈, 자신감 부족'),

('은둔자 (The Hermit)', '/images/tarot/major/9. 은둔자 카드.jpg',
 '내면 탐구, 고독, 지혜 추구, 성찰, 영적 지도',
 '고립, 외로움, 사회적 철수, 내면 회피, 지나친 은둔'),

('운명의 수레바퀴 (Wheel of Fortune)', '/images/tarot/major/10. 운명의 수레바퀴.jpg',
 '변화, 행운, 전환점, 운명의 흐름, 새로운 국면',
 '불운, 저항, 변화 거부, 악순환, 통제력 상실'),

('정의 (Justice)', '/images/tarot/major/11. 정의 카드.jpg',
 '공정함, 진실, 균형, 인과응보, 법과 윤리',
 '불공정, 불균형, 편견, 책임 회피, 부당한 결과'),

('매달린 사람 (The Hanged Man)', '/images/tarot/major/12. 행맨 카드.jpg',
 '희생, 새로운 관점, 기다림, 내려놓음, 깨달음',
 '지연, 희생 거부, 집착, 무기력, 현실 도피'),

('죽음 (Death)', '/images/tarot/major/13. 죽음 카드.jpg',
 '변환, 끝과 새로운 시작, 해방, 필연적 변화, 전환',
 '변화 저항, 집착, 정체, 과거에 얽매임, 두려움'),

('절제 (Temperance)', '/images/tarot/major/14. 절제 카드.jpg',
 '균형, 조화, 인내, 중용, 치유와 통합',
 '불균형, 과잉, 극단적 행동, 인내 부족, 갈등'),

('악마 (The Devil)', '/images/tarot/major/15. 악마 카드.jpg',
 '속박, 중독, 물질주의, 그림자 자아, 욕망의 덫',
 '해방, 속박에서 벗어남, 자각, 의존성 극복, 자유'),

('탑 (The Tower)', '/images/tarot/major/16. 타워 카드.jpg',
 '갑작스러운 변화, 붕괴, 충격적 사건, 기존 구조 해체, 깨달음',
 '변화 회피, 재앙 지연, 두려움, 파국 직전, 억압'),

('별 (The Star)', '/images/tarot/major/17. 별 카드.jpg',
 '희망, 치유, 영감, 회복, 미래에 대한 긍정',
 '절망, 희망 상실, 불신, 자기 과신, 현실 도피'),

('달 (The Moon)', '/images/tarot/major/18. 달 카드.jpg',
 '무의식, 환상, 혼란, 직관, 숨겨진 진실',
 '혼란 해소, 두려움 극복, 억압된 감정 표출, 명확성 회복'),

('태양 (The Sun)', '/images/tarot/major/19. 태양 카드.jpg',
 '성공, 기쁨, 활력, 긍정, 명확성과 자신감',
 '우울, 비관, 지연된 성공, 자신감 부족, 과신'),

('심판 (Judgement)', '/images/tarot/major/20. 심판 카드.jpg',
 '각성, 재탄생, 자기 평가, 용서, 새로운 소명',
 '자기 비판, 후회, 과거 집착, 변화 거부, 내면의 목소리 무시'),

('세계 (The World)', '/images/tarot/major/21. 세계 카드.jpg',
 '완성, 성취, 통합, 여행, 완벽한 결말',
 '미완성, 지연, 목표 미달, 단절, 마무리 부족'),
-- =====================
-- 마이너 아르카나 - 지팡이 (Wands) 14장
-- =====================
('지팡이 에이스 (Ace of Wands)', '/images/tarot/wands/완드 에이스.jpg',
 '새로운 시작, 창의적 영감, 열정의 불꽃, 도전 의욕',
 '창의력 부족, 지연, 에너지 낭비, 시작의 두려움'),

('지팡이 2 (Two of Wands)', '/images/tarot/wands/완드2.jpg',
 '계획, 미래 비전, 결정의 기로, 탐험과 확장',
 '결정 장애, 안주, 두려움, 목표 불명확'),

('지팡이 3 (Three of Wands)', '/images/tarot/wands/완드3.jpg',
 '진보, 확장, 리더십, 원거리 계획, 기회 포착',
 '지연, 장애물, 기대에 못 미침, 소통 부재'),

('지팡이 4 (Four of Wands)', '/images/tarot/wands/완드4.jpg',
 '축하, 안정, 화목한 가정, 성취 기념, 공동체',
 '불안정한 기반, 갈등, 행사 지연, 불완전한 축하'),

('지팡이 5 (Five of Wands)', '/images/tarot/wands/완드5.jpg',
 '경쟁, 갈등, 에너지 충돌, 도전, 의견 충돌',
 '갈등 회피, 경쟁 두려움, 억압된 분노, 내부 갈등'),

('지팡이 6 (Six of Wands)', '/images/tarot/wands/완드6.jpg',
 '승리, 인정, 성공, 자신감, 대중적 인기',
 '자만심, 인정 욕구 과잉, 실패 두려움, 자신감 부족'),

('지팡이 7 (Seven of Wands)', '/images/tarot/wands/완드7.jpg',
 '방어, 도전에 맞섬, 끈기, 입장 고수, 경쟁에서 우위',
 '방어적 태도 과잉, 압박감, 포기, 불안'),

('지팡이 8 (Eight of Wands)', '/images/tarot/wands/완드8.jpg',
 '빠른 진행, 소식 전달, 여행, 에너지 집중, 목표를 향한 가속',
 '지연, 좌절, 소통 오류, 에너지 분산'),

('지팡이 9 (Nine of Wands)', '/images/tarot/wands/완드9.jpg',
 '인내, 회복력, 끝까지 버팀, 경계 설정, 마지막 저항',
 '완고함, 과도한 방어, 번아웃, 포기 직전'),

('지팡이 10 (Ten of Wands)', '/images/tarot/wands/완드10.jpg',
 '과중한 부담, 책임감, 완성을 향한 마지막 노력, 희생',
 '과부하, 번아웃, 짐 내려놓기, 책임 전가'),

('지팡이 시종 (Page of Wands)', '/images/tarot/wands/완드 페이지.jpg',
 '탐험, 열정적 시작, 새로운 아이디어, 자유로운 영혼',
 '충동적, 방향성 부재, 열정 과잉, 집중력 부족'),

('지팡이 기사 (Knight of Wands)', '/images/tarot/wands/완드 나이트.jpg',
 '행동력, 모험, 충동적 에너지, 열정적 추진',
 '무모함, 충동성, 일관성 부족, 분산된 에너지'),

('지팡이 여왕 (Queen of Wands)', '/images/tarot/wands/완드 퀸.jpg',
 '자신감, 카리스마, 창의성, 따뜻한 리더십, 독립심',
 '질투, 자기중심, 변덕, 에너지 소진'),

('지팡이 왕 (King of Wands)', '/images/tarot/wands/완드 킹.jpg',
 '비전 있는 리더, 기업가 정신, 강한 의지, 영감을 주는 존재',
 '독선, 성급함, 오만, 권위주의'),
-- =====================
-- 마이너 아르카나 - 컵 (Cups) 14장
-- =====================
('컵 에이스 (Ace of Cups)', '/images/tarot/cups/컵 에이스.jpg',
 '새로운 감정, 사랑의 시작, 직관의 흐름, 감성적 충만',
 '감정 억압, 공허함, 사랑 거부, 내면 차단'),

('컵 2 (Two of Cups)', '/images/tarot/cups/컵2.jpg',
 '상호 이해, 파트너십, 감정적 유대, 사랑의 연결',
 '불화, 관계 단절, 오해, 균형 상실'),

('컵 3 (Three of Cups)', '/images/tarot/cups/컵3.jpg',
 '우정, 축하, 커뮤니티, 공동의 기쁨, 사교성',
 '과잉 향락, 고립, 삼각관계, 자기 탐닉'),

('컵 4 (Four of Cups)', '/images/tarot/cups/컵4.jpg',
 '명상, 내면 성찰, 불만족, 무관심, 새로운 기회 인식',
 '새로운 관점 수용, 동기부여, 기회 포착'),

('컵 5 (Five of Cups)', '/images/tarot/cups/컵5.jpg',
 '상실, 후회, 슬픔, 실망, 과거에 대한 집착',
 '회복, 앞으로 나아감, 용서, 희망 발견'),

('컵 6 (Six of Cups)', '/images/tarot/cups/컵6.jpg',
 '향수, 순수한 기억, 과거의 행복, 선물, 어린 시절',
 '과거 집착, 미성숙, 현실 도피, 변화 거부'),

('컵 7 (Seven of Cups)', '/images/tarot/cups/컵7.jpg',
 '환상, 선택의 혼란, 꿈과 현실의 혼동, 다양한 가능성',
 '명확한 선택, 환상 깨기, 현실 직시, 집중력 회복'),

('컵 8 (Eight of Cups)', '/images/tarot/cups/컵8.jpg',
 '떠남, 더 깊은 의미 추구, 포기와 해방, 영적 여정',
 '집착, 현실 도피, 두려움으로 인한 머뭄, 무기력'),

('컵 9 (Nine of Cups)', '/images/tarot/cups/컵9.jpg',
 '소원 성취, 만족, 행복, 감사, 감정적 풍요',
 '물질적 행복에 집착, 불만족, 과욕, 행복 미루기'),

('컵 10 (Ten of Cups)', '/images/tarot/cups/컵10.jpg',
 '완전한 행복, 가정의 평화, 사랑의 완성, 조화로운 관계',
 '가족 갈등, 이상과 현실의 괴리, 불화, 고립'),

('컵 시종 (Page of Cups)', '/images/tarot/cups/컵 페이지.jpg',
 '창의적 메시지, 직관적 영감, 감성적 탐구, 섬세함',
 '감정 기복, 비현실적 기대, 과도한 감수성'),

('컵 기사 (Knight of Cups)', '/images/tarot/cups/컵 나이트.jpg',
 '낭만적 추구, 이상주의, 감성적 행동, 예술적 감성',
 '감정적 조작, 변덕, 비현실적, 우유부단'),

('컵 여왕 (Queen of Cups)', '/images/tarot/cups/컵 퀸.jpg',
 '공감 능력, 직관력, 감성적 지혜, 치유, 모성적 사랑',
 '감정 의존, 불안정, 자기 희생 과잉, 경계 부재'),

('컵 왕 (King of Cups)', '/images/tarot/cups/컵 킹.jpg',
 '감정적 성숙, 균형 잡힌 감수성, 지혜로운 리더십, 공감',
 '감정 조작, 냉담함, 감정 억압, 변덕스러운 권위'),
-- =====================
-- 마이너 아르카나 - 검 (Swords) 14장
-- =====================
('검 에이스 (Ace of Swords)', '/images/tarot/swords/소드 에이스.jpg',
 '명확한 사고, 진실 추구, 결단력, 새로운 아이디어, 돌파구',
 '혼란, 잘못된 정보, 지나친 비판, 파괴적 언어'),

('검 2 (Two of Swords)', '/images/tarot/swords/소드2.jpg',
 '결정 보류, 교착 상태, 내면의 갈등, 균형 유지',
 '결정 회피, 정보 과부하, 혼란, 선택 장애'),

('검 3 (Three of Swords)', '/images/tarot/swords/소드3.jpg',
 '슬픔, 가슴의 상처, 이별, 배신, 정서적 고통',
 '회복, 상처 치유, 용서, 슬픔 극복'),

('검 4 (Four of Swords)', '/images/tarot/swords/소드4.jpg',
 '휴식, 회복, 명상, 잠시 멈춤, 재충전',
 '회복 후 복귀, 행동 재개, 정체, 번아웃'),

('검 5 (Five of Swords)', '/images/tarot/swords/소드5.jpg',
 '갈등, 패배, 비겁한 승리, 갈등 후 손실, 이기심',
 '화해, 갈등 해소, 패배 수용, 앙갚음 포기'),

('검 6 (Six of Swords)', '/images/tarot/swords/소드6.jpg',
 '전환, 이행, 어려움에서 벗어남, 새로운 환경으로 이동',
 '정체, 과거에서 벗어나지 못함, 여행 취소, 저항'),

('검 7 (Seven of Swords)', '/images/tarot/swords/소드7.jpg',
 '전략적 행동, 홀로 해결, 교활함, 비밀 작전',
 '양심의 가책, 비밀 폭로, 솔직함 회복, 협력'),

('검 8 (Eight of Swords)', '/images/tarot/swords/소드8.jpg',
 '속박, 제한된 사고, 피해자 의식, 스스로 만든 감옥',
 '자유, 제한에서 해방, 새로운 관점, 자기 해방'),

('검 9 (Nine of Swords)', '/images/tarot/swords/소드9.jpg',
 '불안, 두려움, 악몽, 과도한 걱정, 죄책감',
 '희망 회복, 두려움 극복, 상황 개선, 걱정 내려놓음'),

('검 10 (Ten of Swords)', '/images/tarot/swords/소드10.jpg',
 '끝, 패배, 배신, 고통스러운 결말, 최악의 상황',
 '회복, 재기, 최악의 끝, 희망의 씨앗'),

('검 시종 (Page of Swords)', '/images/tarot/swords/소드 페이지.jpg',
 '호기심, 날카로운 지성, 새로운 아이디어, 경계 유지',
 '충동적 발언, 험담, 경솔한 행동, 정보 오용'),

('검 기사 (Knight of Swords)', '/images/tarot/swords/소드 나이트.jpg',
 '빠른 행동, 날카로운 판단, 직설적 소통, 지적 추진력',
 '충동성, 무모한 행동, 공격성, 경솔함'),

('검 여왕 (Queen of Swords)', '/images/tarot/swords/소드 퀸.jpg',
 '독립적 사고, 명확한 판단, 냉철한 지성, 솔직한 소통',
 '냉혹함, 지나친 비판, 정서적 단절, 쓴소리 과잉'),

('검 왕 (King of Swords)', '/images/tarot/swords/소드 킹.jpg',
 '지적 권위, 공정한 판단, 논리적 리더십, 원칙 고수',
 '독재적 사고, 냉담함, 권력 남용, 감정 배제'),
-- =====================
-- 마이너 아르카나 - 펜타클 (Pentacles) 14장
-- =====================
('펜타클 에이스 (Ace of Pentacles)', '/images/tarot/pentacles/펜타클 에이스.jpg',
 '새로운 물질적 기회, 재정적 시작, 현실적 기반, 번영의 씨앗',
 '기회 놓침, 재정 불안, 물질주의, 계획 부재'),

('펜타클 2 (Two of Pentacles)', '/images/tarot/pentacles/펜타클2.jpg',
 '균형 잡기, 유연한 적응, 멀티태스킹, 변화 속 균형',
 '과부하, 재정 불균형, 혼란, 우선순위 상실'),

('펜타클 3 (Three of Pentacles)', '/images/tarot/pentacles/펜타클3.jpg',
 '협력, 팀워크, 기술 습득, 장인 정신, 공동 작업',
 '불화, 협력 부재, 기술 부족, 낮은 품질'),

('펜타클 4 (Four of Pentacles)', '/images/tarot/pentacles/펜타클4.jpg',
 '안정 추구, 소유욕, 절약, 재정적 보수성, 통제',
 '인색함, 집착, 변화 거부, 물질에 대한 두려움'),

('펜타클 5 (Five of Pentacles)', '/images/tarot/pentacles/펜타클5.jpg',
 '재정적 어려움, 결핍감, 고립, 건강 문제, 걱정',
 '회복, 도움 수용, 재정 개선, 희망 발견'),

('펜타클 6 (Six of Pentacles)', '/images/tarot/pentacles/펜타클6.jpg',
 '관대함, 나눔, 재정적 지원, 균형 잡힌 교환, 자선',
 '불공평한 나눔, 권력 불균형, 빚, 조건부 관대함'),

('펜타클 7 (Seven of Pentacles)', '/images/tarot/pentacles/펜타클7.jpg',
 '인내, 장기적 투자, 노력의 결실 기다림, 평가와 성찰',
 '조급함, 수익 미달, 노력 낭비, 방향 재검토 필요'),

('펜타클 8 (Eight of Pentacles)', '/images/tarot/pentacles/펜타클8.jpg',
 '성실한 노력, 기술 연마, 집중, 장인 정신, 꾸준한 발전',
 '완벽주의, 단조로움, 동기 부족, 능력 낭비'),

('펜타클 9 (Nine of Pentacles)', '/images/tarot/pentacles/펜타클9.jpg',
 '자립, 물질적 풍요, 성취감, 독립적 성공, 여유',
 '과소비, 의존성, 자립심 부족, 물질에 집착'),

('펜타클 10 (Ten of Pentacles)', '/images/tarot/pentacles/펜타클10.jpg',
 '부유함, 가족의 유산, 장기적 안정, 전통, 완전한 풍요',
 '가족 갈등, 재정 손실, 불안정한 기반, 유산 문제'),

('펜타클 시종 (Page of Pentacles)', '/images/tarot/pentacles/펜타클 페이지.jpg',
 '학습, 현실적 목표, 새로운 기회 탐색, 성실한 시작',
 '현실 감각 부족, 나태함, 기회 놓침, 집중력 부족'),

('펜타클 기사 (Knight of Pentacles)', '/images/tarot/pentacles/펜타클 나이트.jpg',
 '성실함, 꾸준한 노력, 책임감, 현실적 접근, 신뢰성',
 '완고함, 지나친 신중함, 변화 저항, 단조로움'),

('펜타클 여왕 (Queen of Pentacles)', '/images/tarot/pentacles/펜타클 퀸.jpg',
 '실용적 지혜, 풍요로운 돌봄, 안정적 환경 조성, 현실적 따뜻함',
 '일 중독, 물질주의, 자기 방치, 과도한 현실주의'),

('펜타클 왕 (King of Pentacles)', '/images/tarot/pentacles/펜타클 킹.jpg',
 '재정적 성공, 안정적 리더십, 현실적 판단, 풍요로운 삶',
 '물질주의, 완고함, 탐욕, 일 중독');