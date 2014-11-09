USE honux77;
-- main db
DROP TABLE IF EXISTS welcome;
CREATE TABLE welcome(
	id INT PRIMARY KEY AUTO_INCREMENT,
	msg VARCHAR(255));

INSERT INTO welcome (msg) VALUES (
	'누구나 코딩을 배울 수 있습니다.'
);
