-- Event Table

DROP TABLE HUGO_EVENT_BOARD CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_BOARD (
	event_idx NUMBER PRIMARY KEY -- PK
	, title varchar2(50) NOT NULL
	, content varchar2(5000)
	, event_period varchar2(50)
	, id varchar2(30) NOT NULL 		-- FK_USER_INFO
	, ofile varchar2(200)
	, like_count NUMBER DEFAULT 0 NOT NULL
	, visit_count NUMBER DEFAULT 0 NOT NULL
	, create_date DATE DEFAULT sysdate NOT NULL
);

DROP TABLE HUGO_EVENT_REPLY CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_REPLY (
	event_reply_idx NUMBER PRIMARY KEY -- PK
	,nickname varchar2(30) NOT NULL
	,writedate DATE DEFAULT sysdate NOT NULL 
	,content varchar2(2000) NOT NULL
	,event_idx NUMBER 		-- FK_EVENT_BOARD
);

DROP TABLE HUGO_COUPON_BOARD CASCADE CONSTRAINTS;
CREATE TABLE HUGO_COUPON_BOARD (
	coupon_idx NUMBER PRIMARY KEY -- PK
	, title varchar2(50) NOT NULL
	, content varchar2(5000)
	, event_period varchar2(50)
	, id varchar2(30) NOT NULL 		-- FK_USER_INFO
	, ofile varchar2(200)
	, like_count NUMBER DEFAULT 0 NOT NULL
	, visit_count NUMBER DEFAULT 0 NOT NULL
	, create_date DATE DEFAULT sysdate NOT NULL
	, cName varchar2(30) NOT NULL
);

DROP TABLE HUGO_COUPON_REPLY CASCADE CONSTRAINTS;
CREATE TABLE HUGO_COUPON_REPLY (
	coupon_reply_idx NUMBER PRIMARY KEY -- PK
	,nickname varchar2(30) NOT NULL
	,writedate DATE DEFAULT sysdate NOT NULL 
	,content varchar2(2000) NOT NULL
	,coupon_idx NUMBER 			-- FK_COUPON_BOARD
);

-- FK 는 나중에 테이블 모두 합친 후 ALTER TABLE 입력 예정
-- Event Table End