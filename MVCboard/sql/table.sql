DROP TABLE member_t;
DROP TABLE board_t;
DROP TABLE reply_t;

CREATE TABLE member_t (
    memberID varchar2(30) PRIMARY KEY,
    memberPW varchar2(30) NOT NULL
);

INSERT INTO member_t VALUES('admin', 'admin'); -- (삭제해도됨 초기 테스트용)

CREATE TABLE board_t (
    post_id         NUMBER          PRIMARY KEY,
    btype           VARCHAR2(20)    NOT NULL,
    author          VARCHAR2(20)    NOT NULL,
    title           VARCHAR2(100)   NOT NULL,
    post_context    VARCHAR2(2000)  NOT NULL,
    create_date     DATE            DEFAULT SYSDATE,
    update_date     DATE            DEFAULT SYSDATE,
    view_cnt        NUMBER          DEFAULT 0,
    reply_cnt       NUMBER          DEFAULT 0,
    like_cnt        NUMBER          DEFAULT 0,
    dislike_cnt     NUMBER          DEFAULT 0
);
SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE BOARD_SEQ;

CREATE SEQUENCE board_seq;

INSERT INTO board_t(post_id, btype, author, title,
post_context, CREATE_DATE, update_date, view_cnt, reply_cnt, like_cnt, dislike_cnt)
VALUES (BOARD_SEQ.NEXTVAL, 'notice', 'memberID', 'title',
'post_context', SYSDATE, SYSDATE, 0, 0, 0, 0);

UPDATE board_t SET post_context='수정된 내용' WHERE post_id=22;

SELECT * FROM member_t;
SELECT * FROM board_t;
SELECT * FROM member_t;

SELECT * FROM TAB;
SELECT * FROM USER_TAB_COLUMNS;