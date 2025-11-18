-- SQL Example
CREATE TABLE messages (
    id INT PRIMARY KEY,
    message VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO messages (id, message) VALUES (1, 'Hello, World!');

SELECT * FROM messages WHERE message LIKE '%Hello%';