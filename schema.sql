-- 1. 유저
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. 일일 기록
CREATE TABLE daily_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    emotion VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 3. 타로 카드 마스터
CREATE TABLE tarot_cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    upright_meaning TEXT,
    reverse_meaning TEXT
);

-- 4. 타로 리딩 결과 (합침)
CREATE TABLE tarot_readings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    record_id INT NOT NULL,
    card_id INT NOT NULL,
    ai_response TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (record_id) REFERENCES daily_records(id),
    FOREIGN KEY (card_id) REFERENCES tarot_cards(id)
);