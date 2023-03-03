

--docker run --name diarydb -e MYSQL_PORT_HOST=% -e MYSQL_ROOT_PASSWORD=test1234@# -p3306:3306 -d mysql:8
--docker exec -it diarydb mysql -uroot -p

create database diarydb;
use diarydb;
CREATE TABLE users(
                      id VARCHAR(36) PRIMARY KEY,
                      diary_title varchar(50),
                      enter_key varchar(100)
);

CREATE TABLE posts(
                      id VARCHAR(36) PRIMARY KEY,
                      user_id VARCHAR(36) NOT NULL,
                      post_comment VARCHAR(600),
                      feelings INT,
                      post_date DATETIME DEFAULT now(),
                      reg_date DATETIME DEFAULT now(),
                      mod_date DATETIME DEFAULT now(),

                      FOREIGN KEY(user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);
