DROP TABLE HUGO_EVENT_BOARD CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_BOARD (
	event_idx NUMBER PRIMARY KEY
	, title varchar2(50) NOT NULL
	, content varchar2(4000)
	, event_period varchar2(50)
	, id varchar2(30) NOT NULL 		-- FK_USER_INFO
	, ofile varchar2(200)
	, like_count NUMBER DEFAULT 0 NOT NULL
	, visit_count NUMBER DEFAULT 0 NOT NULL
	, create_date DATE DEFAULT sysdate NOT NULL
);

DROP TABLE HUGO_EVENT_REPLY CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_REPLY (
	event_reply_idx NUMBER PRIMARY KEY
	,nickname varchar2(30) NOT NULL
	,writedate DATE DEFAULT sysdate NOT NULL 
	,content varchar2(2000) NOT NULL
	,event_idx NUMBER 		-- FK_EVENT_BOARD
);

DROP TABLE HUGO_COUPON_BOARD CASCADE CONSTRAINTS;
CREATE TABLE HUGO_COUPON_BOARD (
	coupon_idx NUMBER PRIMARY KEY
	, title varchar2(50) NOT NULL
	, content varchar2(4000)
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
	coupon_reply_idx NUMBER PRIMARY KEY
	,nickname varchar2(30) NOT NULL
	,writedate DATE DEFAULT sysdate NOT NULL 
	,content varchar2(2000) NOT NULL
	,coupon_idx NUMBER 			-- FK_COUPON_BOARD
);

DROP TABLE HUGO_EVENT_IMAGE CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_IMAGE (
	IMG_IDX NUMBER PRIMARY KEY
	,IMG_NAME VARCHAR2(100) NOT NULL
	,EVENT_IDX NUMBER 			-- FK_EVENT_BOARD
);

DROP TABLE HUGO_COUPON_IMAGE CASCADE CONSTRAINTS;
CREATE TABLE HUGO_COUPON_IMAGE (
	IMG_IDX NUMBER PRIMARY KEY
	,IMG_NAME VARCHAR2(100) NOT NULL
	,COUPON_IDX NUMBER 			-- FK_COUPON_BOARD
);

-- FK 는 나중에 테이블 모두 합친 후 입력 예정

-- 새글 번호 가져오기
SELECT NVL(MAX(event_idx),0)+1 AS ARTICLENO 
			FROM HUGO_EVENT_BOARD;
-- 새 이미지 파일 가져오기
SELECT NVL(MAX(IMG_IDX),0) AS imageFileNO 
			FROM HUGO_EVENT_IMAGE;
-- 이벤트 새글 등록
INSERT INTO HUGO_EVENT_BOARD (event_idx,title,content,event_period,id,ofile) VALUES 
(1,'제목','내용','2022.08.01~2022.08.31','admin','첨부파일');
ROLLBACK;
-- 이벤트 이미지 새글 등록
INSERT INTO HUGO_EVENT_IMAGE (IMG_IDX,IMG_NAME,EVENT_IDX) VALUES (3,'첨부파일',1);
ROLLBACK;

SELECT * FROM HUGO_EVENT_IMAGE;

-- Event Table End

-- user info start

-- 회원가입 테이블 만들기
DROP TABLE HUGO_USER_INFO CASCADE CONSTRAINTS;
CREATE TABLE HUGO_USER_INFO (
	ID VARCHAR2(30) PRIMARY KEY
	,PWD VARCHAR2(30) NOT NULL
	,NAME VARCHAR2(10) NOT NULL
	,NICKNAME VARCHAR2(30) NOT NULL
	,EMAIL VARCHAR2(50) NOT NULL
	,BIRTHDAY DATE NOT NULL
	,GENDER VARCHAR2(20) NOT NULL
	,CALLNUM VARCHAR2(50) NOT NULL
	,INTEREST VARCHAR2(100) 
	,JOINDATE DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO HUGO_USER_INFO
(ID, PWD, NAME, NICKNAME, EMAIL, BIRTHDAY, GENDER, CALLNUM)
VALUES('admin', '0824', '관리자', '홍길동', 'admin@gmail.com', '1994-02-19', '남', '010-9244-2499');

SELECT * FROM HUGO_USER_INFO;

-- 아이디 중복 체크
SELECT decode(COUNT(*),1, 'true', 0, 'false')
			FROM HUGO_USER_INFO 
			WHERE ID = 'admin';
		
-- user_info end
		
-- 매장 맛집 명소 테이블

-- 매장 크롤용 URL

DROP TABLE URL_INFO CASCADE CONSTRAINTS;
CREATE TABLE URL_info (
	urlNO NUMBER(10) PRIMARY KEY,
	name varchar2(100), 
	url varchar2(1000)
);

-- board

DROP TABLE Review_board CASCADE CONSTRAINTS;
CREATE TABLE Review_board(
	articleIdx number(20) PRIMARY KEY, --pk
	hotplaceIdx number(5) DEFAULT 1, -- fk
	contents varchar2(2000) NOT NULL,
	username varchar2(100) NOT NULL,
	userTotalReview number(10) NOT NULL DEFAULT 0,
	restIdx varchar2(2000) NOT null,		-- fk	
	regdate DATE DEFAULT sysdate,
	reviewStamp number(5) DEFAULT 0;
	
);

-- restaurant

DROP TABLE restaurant_info CASCADE CONSTRAINTS;
CREATE TABLE restaurant_info(
	restIdx number(38) PRIMARY KEY, -- pk
	restName varchar2(200) NOT NULL,
	restAddress varchar2(500),
	restJibunAddress varchar2(300),
	restPhone varchar2(100),
	restMenu varchar2(100),
	restPrice varchar2(200),
	restPark varchar2(200),
	restOpen varchar2(200),
	restMenuList varchar2(1000),
	restUpdateDate date DEFAULT sysdate,
	restTag varchar2(1000),
	restStarAvg number(10) DEFAULT 0,
	restVisitCount number(10) DEFAULT 0,
	restReviewCount number(10) DEFAULT 0,
	restJjim number(10) DEFAULT 0,
	hotplaceIdx number(10) DEFAULT 1
);



