USE honux77;

-- disable foreign key
SET FOREIGN_KEY_CHECKS=0;

-- main db
DROP TABLE IF EXISTS welcome;
CREATE TABLE welcome(
	id INT PRIMARY KEY AUTO_INCREMENT,
	msg VARCHAR(255));

INSERT INTO welcome (msg) VALUES 
	('누구나 프로그래밍을 할 수 있습니다.');

-- courses
DROP TABLE IF EXISTS course;
CREATE TABLE course (
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(64),
	link VARCHAR(255),
	lecturer INT,
	course_desc VARCHAR(255), 
	FOREIGN KEY (lecturer) REFERENCES user(uid)
);


INSERT INTO course (cname, link, course_desc) VALUES
	('데이터베이스 베이직',
	'http://opentutorials.org/module/1256',
	'관계형데이터베이스 및 mysql의 기초를 학습합니다. 프로그래밍에 대한 기초 경험이 필요합니다.');

-- users
-- A: admin, T:lecturer, S:student
-- AT- : admin & lecturer
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64),
	role CHAR(3),
	email CHAR(64) 
);
