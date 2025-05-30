CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255),
                       pw VARCHAR(255)
);

INSERT INTO users (name, pw) VALUES ('admin', '1234');
INSERT INTO users (name, pw) VALUES ('guest', 'guest');

CREATE TABLE board (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255),
                       content TEXT
);

INSERT INTO board (title, content) VALUES ('첫 번째 글', '내용입니다.');
INSERT INTO board (title, content) VALUES ('두 번째 글', '반가워요');