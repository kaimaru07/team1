DROP TABLE account;
DROP SEQUENCE account_seq;

CREATE SEQUENCE account_seq start with 1 NOCACHE;

CREATE TABLE account(
	id NUMBER,
	nickname VARCHAR2(64),
	name VARCHAR2(64),
	pwd VARCHAR2(64),
	email VARCHAR2(128)
);

ALTER TABLE account ADD CONSTRAINT account_id_PK PRIMARY KEY(id);
ALTER TABLE account MODIFY nickname CONSTRAINT account_nickname_NN NOT NULL;
ALTER TABLE account MODIFY name CONSTRAINT account_username_NN NOT NULL;
ALTER TABLE account MODIFY pwd CONSTRAINT account_password_NN NOT NULL;
ALTER TABLE account MODIFY email CONSTRAINT account_email_NN NOT NULL;

COMMENT ON COLUMN account.id IS '사용자 계정 식별 번호';
COMMENT ON COLUMN account.nickname IS '사용자 계정 닉네임';
COMMENT ON COLUMN account.name IS '사용자 이름';
COMMENT ON COLUMN account.pwd IS '사용자 로그인 암호';
COMMENT ON COLUMN account.email IS '사용자 이메일 주소(로그인 아이디로 사용)';

INSERT INTO account(id, nickname, name, pwd, email) VALUES(account_seq.NEXTVAL, '닉관리자', '관리자', 'admin', 'admin@sample.com');
INSERT INTO account(id, nickname, name, pwd, email) VALUES(account_seq.NEXTVAL, '닉유저1', '가유저', 'user1', 'user1@sample.com');
INSERT INTO account(id, nickname, name, pwd, email) VALUES(account_seq.NEXTVAL, '닉유저2', '나유저', 'user2', 'user2@sample.com');
INSERT INTO account(id, nickname, name, pwd, email) VALUES(account_seq.NEXTVAL, '닉유저3', '다유저', 'user3', 'user3@sample.com');
INSERT INTO account(id, nickname, name, pwd, email) VALUES(account_seq.NEXTVAL, '닉유저4', '라유저', 'user4', 'user4@sample.com');

SELECT * FROM account;

UPDATE account
   SET nickname = '닉유저8'
     , name = '아유저'
     , pwd = 'user8'
     , email = 'user8@sample.com'
 WHERE id = 9

