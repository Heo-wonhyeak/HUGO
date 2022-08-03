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

-- 매장 맛집 명소 테이블

-- 매장 크롤용 URL

DROP TABLE URL_INFO CASCADE CONSTRAINTS;
CREATE TABLE URL_info (
	urlNO NUMBER(10) PRIMARY KEY,
	name varchar2(100), 
	url varchar2(1000)
);

-- restaurant

DROP TABLE restaurant_info CASCADE CONSTRAINTS;
CREATE TABLE restaurant_info(
	rest_idx number(38) PRIMARY KEY, -- pk
	rest_name varchar2(200) NOT NULL,
	rest_address varchar2(500),
	rest_jibunAddress varchar2(300),
	rest_phone varchar2(100),
	rest_menu varchar2(100),
	rest_price varchar2(200),
	rest_park varchar2(200),
	rest_open varchar2(200),
	rest_menu_list varchar2(1000),
	rest_update_date date DEFAULT sysdate,
	rest_tag varchar2(1000),
	rest_starAvg number(10) DEFAULT 0,
	rest_visitCount number(10) DEFAULT 0,
	rest_reviewCount number(10) DEFAULT 0,
	rest_jjim number(10) DEFAULT 0,
	hotplace_idx number(10) DEFAULT 1
);







