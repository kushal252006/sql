CREATE DATABASE facebook_db;
USE facebook_db;

CREATE TABLE user_info (
    user_id CHAR(4) PRIMARY KEY,
    userName VARCHAR(20) NOT NULL UNIQUE,
    phone_number BIGINT UNIQUE CHECK(phone_number BETWEEN 1000000000 AND 9999999999),
    dob DATE NOT NULL CHECK (dob BETWEEN '2000-01-01' AND '2015-12-31'),
    country VARCHAR(10) DEFAULT 'India'
);

DESC user_info;


INSERT INTO user_info 
VALUES ('F0001', 'kushal123', 9123456780, '2004-05-12', 'India');
---x 17:03:43	INSERT INTO user_info  VALUES ('F0001', 'kushal123', 9123456780, '2004-05-12', 'India')	
Error Code: 1406. Data too long for column 'user_id' at row 1	0.016 sec

INSERT INTO user_info 
VALUES ('F001', 9123456780, '2004-05-12', 'India');
17:06:40	INSERT INTO user_info  VALUES ('F001', 9123456780, '2004-05-12', 'India')	
Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec

INSERT INTO user_info 
VALUES ('F002', 'bharu_r', 98765012345, '2002-11-20', 'India');
Error Code: 3819. Check constraint 'user_info_chk_1' is violated.

INSERT INTO user_info 
VALUES ('F003', 'niru', 9012345678, '2020-01-01', 'India');
Error Code: 3819. Check constraint 'user_info_chk_2' is violated.

correct data
INSERT INTO user_info 
VALUES ('F001', 'rahul123', 9123456780, '2004-05-12', 'India');

INSERT INTO user_info 
VALUES ('F002', 'bharu_r', 9876501234, '2002-11-20', 'India');

_____________________________________________________________________________________________________________

CREATE TABLE stories (
    story_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    views INT DEFAULT 0 CHECK (views >= 0),
    duration INT NOT NULL CHECK (duration BETWEEN 5 AND 60),
    status VARCHAR(10) DEFAULT 'active'
);

DESC stories;


INSERT INTO stories VALUES (1, 100, 30, 'active');
Error Code: 1136. Column count doesn't match value count at row 1

INSERT INTO stories VALUES (1, 'morning fun', 50, 20, 'active');

INSERT INTO stories VALUES (2, 'travel time', 80, 3, 'active');
Error Code: 3819. Check constraint 'stories_chk_2' is violated.

INSERT INTO stories VALUES (3, 'morning fun', 60, 25, 'active');
Error Code: 1062. Duplicate entry 'morning fun' for key 'stories.title'

CORRECT INSERTION
INSERT INTO stories VALUES (1, 'morning fun', 50, 20, 'active');
INSERT INTO stories VALUES (2, 'travel time', 80, 25, 'active');

*****************************************************************************************************
CREATE TABLE messages (
    message_id INT PRIMARY KEY,
    message_text VARCHAR(100) NOT NULL UNIQUE,
    length INT DEFAULT 1 CHECK (length > 0),
    priority INT NOT NULL CHECK (priority BETWEEN 1 AND 5),
    status VARCHAR(10) DEFAULT 'sent'
);

DESC messages;

INSERT INTO messages VALUES (1, 10, 3, 'sent');
Error Code: 1136. Column count doesn't match value count at row 1


INSERT INTO messages VALUES (1, 'Hello', 0, 3, 'sent');
Error Code: 3819. Check constraint 'messages_chk_1' is violated.

INSERT INTO messages VALUES (2, 'Hi there', 10, 6, 'sent');
Error Code: 3819. Check constraint 'messages_chk_2' is violated.

INSERT INTO messages VALUES (3, 'Hello', 20, 2, 'sent');
INSERT INTO messages VALUES (1, 'Hello', 20, 2, 'sent');
Error Code: 1062. Duplicate entry 'Hello' for key 'messages.message_text'

INSERT INTO messages VALUES (2, 'Hi there', 15, 3, 'sent');

===============================================================================================================

CREATE TABLE notifications (
    notification_id INT PRIMARY KEY,
    notification_text VARCHAR(100) NOT NULL UNIQUE,
    count INT DEFAULT 1 CHECK (count >= 1),
    type VARCHAR(20) NOT NULL CHECK (type IN ('like', 'comment', 'follow')),
    status VARCHAR(10) DEFAULT 'unread'
);

DESC notifications;

INSERT INTO notifications VALUES (1, 1, 'like', 'unread');
Error Code: 1136. Column count doesn't match value count at row 1

INSERT INTO notifications VALUES (1, 'New like', 0, 'like', 'unread');
Error Code: 3819. Check constraint 'notifications_chk_1' is violated.

INSERT INTO notifications VALUES (2, 'New comment', 1, 'likes', 'unread');
Error Code: 3819. Check constraint 'notifications_chk_2' is violated.

INSERT INTO notifications VALUES (3, 'New like', 1, 'like', 'unread');

INSERT INTO notifications VALUES (1, 'New like', 1, 'like', 'unread');
Error Code: 1062. Duplicate entry 'New like' for key 'notifications.notification_text'

INSERT INTO notifications VALUES (2, 'New comment', 2, 'comment', 'unread');

-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE reels (
    reel_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE,
    views INT DEFAULT 0 CHECK (views >= 0),
    duration INT NOT NULL CHECK (duration BETWEEN 10 AND 120),
    category VARCHAR(20) DEFAULT 'general'
);

DESC reels;

INSERT INTO reels VALUES (1, 500, 45, 'general');
Error Code: 1136. Column count doesn't match value count at row 1

INSERT INTO reels VALUES (1, 'funny clip', -10, 45, 'general');
Error Code: 3819. Check constraint 'reels_chk_1' is violated.

INSERT INTO reels VALUES (2, 'travel vlog', 300, 5, 'general');
Error Code: 3819. Check constraint 'reels_chk_2' is violated.

INSERT INTO reels VALUES (3, 'funny clip', 200, 40, 'general');

INSERT INTO reels VALUES (1, 'funny clip', 500, 45, 'comedy');
Error Code: 1062. Duplicate entry 'funny clip' for key 'reels.title'

INSERT INTO reels VALUES (2, 'travel vlog', 300, 60, 'travel');