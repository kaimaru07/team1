-- 테이블 삭제 구문
DROP TABLE member_t;
DROP TABLE board_t;
DROP TABLE reply_t;
DROP TABLE like_t;

-- 시퀀스 관련 구문
SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE reply_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE reply_seq;

-- 테이블 생성 구문
CREATE TABLE member_t (
    memberID varchar2(30) PRIMARY KEY,
    memberPW varchar2(30) NOT NULL
);

CREATE TABLE board_t (
    post_id         NUMBER          PRIMARY KEY,
    btype           VARCHAR2(20)    NOT NULL,
    author          VARCHAR2(20)    NOT NULL,
    title           VARCHAR2(100)   NOT NULL,
    post_context    VARCHAR2(2000)  NOT NULL,
    create_date     VARCHAR2(20)    DEFAULT TO_CHAR(SYSDATE + 9/24, 'MM/DD HH24:MI'),
    update_date     VARCHAR2(20)    DEFAULT TO_CHAR(SYSDATE + 9/24, 'MM/DD HH24:MI'),
    view_cnt        NUMBER          DEFAULT 0,
    reply_cnt       NUMBER          DEFAULT 0,
    like_cnt        NUMBER          DEFAULT 0,
    dislike_cnt     NUMBER          DEFAULT 0
);

CREATE TABLE reply_t (
    reply_id NUMBER PRIMARY KEY,
    post_id NUMBER REFERENCES board_t(post_id),
    reply_author VARCHAR2(20) NOT NULL,
    reply_context VARCHAR2(2000) NOT NULL,
    reply_date DATE DEFAULT SYSDATE,
    real_author VARCHAR2(30) NOT NULL
);

CREATE TABLE like_t (
    post_id NUMBER REFERENCES board_t(post_id),
    memberID VARCHAR2(30) REFERENCES member_t(memberID),
    CONSTRAINT dupkey PRIMARY KEY(post_id, memberID)
);

-- 선택 구문
SELECT * FROM TAB;
SELECT * FROM USER_TAB_COLUMNS;

SELECT * FROM member_t;
SELECT * FROM board_t ORDER BY post_id DESC;
SELECT * FROM reply_t ORDER BY reply_id DESC;
SELECT * FROM like_t;