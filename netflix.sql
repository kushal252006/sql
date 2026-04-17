
create database netflix;
use netflix;

create table user_info (user_id CHAR(5) PRIMARY KEY,userName VARCHAR(18) not null UNIQUE,phone_number BIGINT UNIQUE CHECK(phone_number BETWEEN 1000000000 AND 9999999999),
    dob DATE NOT NULL CHECK (dob BETWEEN '2010-01-01' AND '2020-12-31'),country VARCHAR(15) DEFAULT 'India'
);
desc user_info;

INSERT INTO user_info VALUES ('N0001','kush',7876501234,'2012-06-12','India');
INSERT INTO user_info VALUES ('N0002','revanth',6123409876,'2013-09-18','India');
INSERT INTO user_info VALUES ('N0003','niru',6988701122,'2011-11-25','India');
INSERT INTO user_info VALUES ('N0004','yogi',7871203344,'2014-02-14','India');
INSERT INTO user_info VALUES ('N0005','sanu',9765409988,'2015-08-21','India');
INSERT INTO user_info VALUES ('N0006','vidya',6345607788,'2016-12-30','India');
INSERT INTO user_info VALUES ('N0007','Nisha',8234506677,'2017-03-17','India');
INSERT INTO user_info VALUES ('N0008','Karthik',8123905566,'2018-07-09','India');
INSERT INTO user_info VALUES ('N0009','sanju',9012304455,'2019-10-11','India');
INSERT INTO user_info VALUES ('N0010','challu',9898703344,'2011-05-05','India');
INSERT INTO user_info VALUES ('N0011','poorvi',6789602233,'2011-09-29','India');
INSERT INTO user_info VALUES ('N0012','bharath',6678501122,'2012-01-13','India');
INSERT INTO user_info VALUES ('N0013','suhas',8567400011,'2013-06-22','India');
INSERT INTO user_info VALUES ('N0014','Deepak',6456308899,'2014-04-01','India');
INSERT INTO user_info VALUES ('N0015','Madthu',9345207788,'2015-12-15','India');
select * from user_info;

create table msg_info(message_id int primary key,user_name varchar(20) not null unique,test_message varchar(100) not null,send boolean not null,user_id char(5),
foreign key(user_id) references user_info(user_id));
desc msg_info;

INSERT INTO msg_info VALUES (1,'kush','Watching a movie',1,'N0001');
INSERT INTO msg_info VALUES (2,'revanth','Started a new series',1,'N0002');
INSERT INTO msg_info VALUES (3,'niru','Paused show',0,'N0003');
INSERT INTO msg_info VALUES (4,'yogi','Binge watching',1,'N0004');
INSERT INTO msg_info VALUES (5,'sanu','Finished episode',1,'N0005');
INSERT INTO msg_info VALUES (6,'vidya','Will watch later',0,'N0006');
INSERT INTO msg_info VALUES (7,'nisha','Great content!',1,'N0007');
select * from msg_info;

create table posts_info (
    post_id INT PRIMARY KEY,post_content VARCHAR(200) NOT NULL,post_date DATE NOT NULL,user_id CHAR(5),FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
desc posts_info;

INSERT INTO posts_info VALUES (201,'Movie Review 1','2024-02-01','N0001');
INSERT INTO posts_info VALUES (202,'Series Update','2024-02-02','N0002');
INSERT INTO posts_info VALUES (203,'New Episode','2024-02-03','N0003');
INSERT INTO posts_info VALUES (204,'Top Picks','2024-02-04','N0004');
INSERT INTO posts_info VALUES (205,'Weekend Watch','2024-02-05','N0005');
INSERT INTO posts_info VALUES (206,'Trending Now','2024-02-06','N0006');
INSERT INTO posts_info VALUES (207,'Best Shows','2024-02-07','N0007');
INSERT INTO posts_info VALUES (208,'New Release','2024-02-08','N0008');
INSERT INTO posts_info VALUES (209,'Recommended','2024-02-09','N0009');
INSERT INTO posts_info VALUES (210,'Must Watch','2024-02-10','N0010');
INSERT INTO posts_info VALUES (211,'Drama Picks','2024-02-11','N0011');
INSERT INTO posts_info VALUES (212,'Action Movies','2024-02-12','N0012');
INSERT INTO posts_info VALUES (213,'Comedy Shows','2024-02-13','N0013');
INSERT INTO posts_info VALUES (214,'Thriller Series','2024-02-14','N0014');
INSERT INTO posts_info VALUES (215,'Sci-Fi Hits','2024-02-15','N0015');
select * from posts_info;

CREATE TABLE comments_info (comment_id INT PRIMARY KEY,comment_text VARCHAR(150) NOT NULL,post_id INT,user_id CHAR(5),FOREIGN KEY (post_id) REFERENCES posts_info(post_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
desc comments_info;

INSERT INTO comments_info VALUES (1,'Amazing content!',201,'N0002');
INSERT INTO comments_info VALUES (2,'Loved this show',202,'N0003');
INSERT INTO comments_info VALUES (3,'Very exciting',203,'N0004');
INSERT INTO comments_info VALUES (4,'Great suggestion',204,'N0005');
INSERT INTO comments_info VALUES (5,'Interesting watch',205,'N0006');
INSERT INTO comments_info VALUES (6,'Highly recommended',206,'N0007');
INSERT INTO comments_info VALUES (7,'Fantastic!',207,'N0008');
select * from comments_info;

CREATE TABLE friends_info (
    friend_id INT PRIMARY KEY,user_id CHAR(5),friend_user_id CHAR(4),status VARCHAR(10) DEFAULT 'accepted'
);
desc friends_info;

INSERT INTO friends_info VALUES (1,'N0001','N002','accepted');
INSERT INTO friends_info VALUES (2,'N0003','N004','accepted');
INSERT INTO friends_info VALUES (3,'N0005','N006','accepted');
INSERT INTO friends_info VALUES (4,'N0007','N008','accepted');
INSERT INTO friends_info VALUES (5,'N0009','N010','accepted');
INSERT INTO friends_info VALUES (6,'N0011','N012','accepted');
INSERT INTO friends_info VALUES (7,'N0013','N014','accepted');
INSERT INTO friends_info VALUES (8,'N0015','N001','accepted');
INSERT INTO friends_info VALUES (9,'N0002','N003','accepted');
INSERT INTO friends_info VALUES (10,'N0004','N005','accepted');
INSERT INTO friends_info VALUES (11,'N0006','N007','accepted');
INSERT INTO friends_info VALUES (12,'N0008','N009','accepted');
INSERT INTO friends_info VALUES (13,'N0010','N011','accepted');
INSERT INTO friends_info VALUES (14,'N0012','N013','accepted');
INSERT INTO friends_info VALUES (15,'N0014','N015','accepted');
select * from friends_info;

CREATE TABLE friend_requests (request_id INT PRIMARY KEY,sender_id CHAR(4),receiver_id CHAR(4),request_status VARCHAR(10) DEFAULT 'pending',FOREIGN KEY (sender_id) REFERENCES user_info(user_id),
FOREIGN KEY (receiver_id) REFERENCES user_info(user_id)
);
desc friend_requests;

INSERT INTO friend_requests VALUES (1,'N0001','N0003','pending');
INSERT INTO friend_requests VALUES (2,'N0002','N0004','pending');
INSERT INTO friend_requests VALUES (3,'N0005','N0007','pending');
INSERT INTO friend_requests VALUES (4,'N0006','N0008','pending');
INSERT INTO friend_requests VALUES (5,'N0009','N0011','pending');
INSERT INTO friend_requests VALUES (6,'N0010','N0012','pending');
INSERT INTO friend_requests VALUES (7,'N0013','N0015','pending');
select * from friend_requests;

CREATE TABLE likes_info (like_id INT PRIMARY KEY,user_id CHAR(5),post_id INT
);
desc likes_info;

INSERT INTO likes_info VALUES (1,'N0001',201);
INSERT INTO likes_info VALUES (2,'N0002',202);
INSERT INTO likes_info VALUES (3,'N0003',203);
INSERT INTO likes_info VALUES (4,'N0004',204);
INSERT INTO likes_info VALUES (5,'N0005',205);
INSERT INTO likes_info VALUES (6,'N0006',206);
INSERT INTO likes_info VALUES (7,'N0007',207);
INSERT INTO likes_info VALUES (8,'N0008',208);
INSERT INTO likes_info VALUES (9,'N0009',209);
INSERT INTO likes_info VALUES (10,'N0010',210);
INSERT INTO likes_info VALUES (11,'N0011',211);
INSERT INTO likes_info VALUES (12,'N0012',212);
INSERT INTO likes_info VALUES (13,'N0013',213);
INSERT INTO likes_info VALUES (14,'N0014',214);
INSERT INTO likes_info VALUES (15,'N0015',215);
select * from likes_info;

CREATE TABLE reactions_info (
    reaction_id INT PRIMARY KEY,
    reaction_type VARCHAR(20) NOT NULL,
    like_id INT,
    FOREIGN KEY (like_id) REFERENCES likes_info(like_id)
);
desc reactions_info;

INSERT INTO reactions_info VALUES (1,'Like',1);
INSERT INTO reactions_info VALUES (2,'Love',2);
INSERT INTO reactions_info VALUES (3,'Wow',3);
INSERT INTO reactions_info VALUES (4,'Haha',4);
INSERT INTO reactions_info VALUES (5,'Excited',5);
INSERT INTO reactions_info VALUES (6,'Bored',6);
INSERT INTO reactions_info VALUES (7,'Super',7);
select * from reactions_info;


