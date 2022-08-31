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
-- 말머리 추가
ALTER TABLE HUGO_EVENT_BOARD ADD writeHeader varchar2(30);
-- 게시판 종류 추가
ALTER TABLE HUGO_EVENT_BOARD ADD boarder varchar2(30) DEFAULT 'runningEvent' NOT NULL;
-- FK_USER_INFO 추가
ALTER TABLE HUGO_EVENT_BOARD ADD CONSTRAINT FK_USER_INFO FOREIGN KEY (id) REFERENCES HUGO_USER_INFO(id) ON DELETE CASCADE;
-- title 값이 작아서 더 길게 변경
ALTER TABLE HUGO_EVENT_BOARD MODIFY title varchar2(1000);

DROP TABLE HUGO_EVENT_REPLY CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_REPLY (
	event_reply_idx NUMBER PRIMARY KEY
	,nickname varchar2(30) NOT NULL
	,writedate DATE DEFAULT sysdate NOT NULL 
	,content varchar2(2000) NOT NULL
	,event_idx NUMBER 		-- FK_EVENT_BOARD
);
-- FK_EVENT_BOARD
ALTER TABLE HUGO_EVENT_REPLY ADD CONSTRAINT FK_EVENT_BOARD FOREIGN KEY (event_idx) REFERENCES HUGO_EVENT_BOARD ON DELETE CASCADE;

DROP TABLE HUGO_EVENT_IMAGE CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_IMAGE (
	IMG_IDX NUMBER PRIMARY KEY
	,IMG_NAME VARCHAR2(100) NOT NULL
	,EVENT_IDX NUMBER 			-- FK_EVENT_BOARD
);
ALTER TABLE HUGO_EVENT_IMAGE ADD CONSTRAINT FK_EVENT_BOARD_IMAGE FOREIGN KEY (event_idx) REFERENCES HUGO_EVENT_BOARD(event_idx) ON DELETE CASCADE;

DROP TABLE HUGO_EVENT_LIKE CASCADE CONSTRAINTS;
CREATE TABLE HUGO_EVENT_LIKE (
	like_idx NUMBER PRIMARY KEY
	, LIKE_YN number(1) DEFAULT 0
	, event_idx NUMBER -- FK_EVENT_BOARD
	, id VARCHAR2(30) -- FK_USER_INFO
);
-- FK_EVENT_BOARD_LIKE
ALTER TABLE HUGO_EVENT_LIKE ADD CONSTRAINT FK_EVENT_BOARD_LIKE FOREIGN KEY (event_idx) REFERENCES HUGO_EVENT_BOARD(event_idx) ON DELETE CASCADE;
-- FK_USER_INFO_LIKE
ALTER TABLE HUGO_EVENT_LIKE ADD CONSTRAINT FK_USER_INFO_LIKE FOREIGN KEY (id) REFERENCES HUGO_USER_INFO(id) ON DELETE CASCADE;

DROP TABLE HUGO_DECLARATION CASCADE CONSTRAINTS;
CREATE TABLE HUGO_DECLARATION (
	decla_idx NUMBER PRIMARY KEY
	,reason varchar2(20) NOT NULL
	,id VARCHAR2(30) -- FK_USER_INFO
	,event_reply_idx NUMBER -- FK_EVENT_REPLY
	,contents varchar2(4000)
);
-- FK_USER_INFO_DECLARATION
ALTER TABLE HUGO_DECLARATION ADD CONSTRAINT FK_USER_INFO_DECLARATION FOREIGN KEY (id) REFERENCES HUGO_USER_INFO(id) ON DELETE CASCADE;
-- FK_EVENT_REPLY_DECLARATION
ALTER TABLE HUGO_DECLARATION ADD CONSTRAINT FK_EVENT_REPLY_DECLARATION FOREIGN KEY (event_reply_idx) REFERENCES HUGO_EVENT_REPLY (event_reply_idx) ON DELETE CASCADE;

-- 이벤트 페이지에서 분기로 만듦 쿠폰 삭제
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
DROP TABLE HUGO_COUPON_IMAGE CASCADE CONSTRAINTS;
CREATE TABLE HUGO_COUPON_IMAGE (
	IMG_IDX NUMBER PRIMARY KEY
	,IMG_NAME VARCHAR2(100) NOT NULL
	,COUPON_IDX NUMBER 			-- FK_COUPON_BOARD
);
-- 여기까지 Drop

-- 새글 번호 가져오기
SELECT NVL(MAX(event_idx),0)+1 AS ARTICLENO 
			FROM HUGO_EVENT_BOARD;
-- 새 이미지 파일 가져오기
SELECT NVL(MAX(IMG_IDX),0) AS imageFileNO 
			FROM HUGO_EVENT_IMAGE;
-- 이벤트 새글 등록
INSERT INTO HUGO_EVENT_BOARD (event_idx,title,content,event_period,id,ofile,writeHeader,boarder) 
VALUES (30,'제목','내용','2022.08.01~2022.08.31','admin','첨부파일','new','runningEvent');
ROLLBACK;
-- 이벤트 이미지 새글 등록
INSERT INTO HUGO_EVENT_IMAGE (IMG_IDX,IMG_NAME,EVENT_IDX) VALUES (3,'첨부파일',1);
ROLLBACK;

SELECT * FROM HUGO_EVENT_IMAGE;

<<<<<<< HEAD
SELECT * FROM HUGO_EVENT_BOARD WHERE BOARDER = 'runningEvent' ORDER BY event_idx DESC ;

UPDATE HUGO_EVENT_BOARD SET OFILE = '21.jpeg' WHERE EVENT_IDX = 21;
COMMIT;

SELECT * FROM HUGO_EVENT_BOARD WHERE EVENT_IDX = 21;

SELECT * FROM HUGO_EVENT_IMAGE
			WHERE event_idx = 21
		ORDER BY IMG_IDX ;
	
UPDATE HUGO_EVENT_BOARD SET VISIT_COUNT  = VISIT_COUNT +1 WHERE EVENT_IDX = 21;

DELETE HUGO_EVENT_BOARD WHERE EVENT_IDX = 21;
ROLLBACK;

UPDATE HUGO_EVENT_BOARD 
SET TITLE = 'mod'
	,CONTENT = 'modContent'
	,EVENT_PERIOD = '2022.07.01-2022.08.31'
	,OFILE ='변경파일'
WHERE EVENT_IDX = 22;

SELECT NVL(MAX(event_reply_idx),0)+1 as event_reply_idx
			FROM HUGO_EVENT_REPLY;
		
INSERT INTO HUGO_EVENT_REPLY (event_reply_idx,nickname,content,event_idx) VALUES
 (1,'홍길동','댓글내용',1);

SELECT * FROM HUGO_EVENT_REPLY WHERE EVENT_IDX = 21 ORDER BY EVENT_REPLY_IDX DESC;
COMMIT;

SELECT NVL(LIKE_YN,0) AS LIKE_YN FROM HUGO_EVENT_LIKE RIGHT OUTER JOIN dual 
on id ='admin' AND EVENT_IDX = 20;

INSERT INTO HUGO_EVENT_LIKE VALUES (1,1,20,'admin');
COMMIT;
ROLLBACK;

SELECT NVL(MAX(LIKE_IDX),0)+1 AS LIKE_IDX 
			FROM HUGO_EVENT_LIKE;
		
DELETE HUGO_EVENT_LIKE WHERE event_idx > 0;

UPDATE HUGO_EVENT_BOARD SET LIKE_COUNT  = LIKE_COUNT +1 WHERE EVENT_IDX = 20;
UPDATE HUGO_EVENT_BOARD SET LIKE_COUNT  = LIKE_COUNT -1 WHERE EVENT_IDX  =20;

SELECT * FROM HUGO_EVENT_REPLY 
			 WHERE EVENT_IDX = 26 ORDER BY EVENT_REPLY_IDX asc;

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

-- url로 매장 urlno 조회

SELECT urlNO FROM URL_INFO WHERE url = 'https://www.mangoplate.com/restaurants/nWdsVJ5zukDH'; 

-- board

DROP TABLE Review_board CASCADE CONSTRAINTS;
CREATE TABLE Review_board(
	articleIdx number(10) PRIMARY KEY, --pk
	hotplaceIdx number(10) DEFAULT 1, -- fk
	contents varchar2(10000),
	NICKNAME varchar2(100) NOT NULL,
	userTotalReview number(10) DEFAULT 0 NOT NULL, 
	restURL varchar2(2000) NOT null,		-- fk	
	regdate DATE DEFAULT sysdate,
	reviewStamp number(10) DEFAULT 0,
	MainImage varchar2(2000) DEFAULT 'x',
	SubImage1 varchar2(2000) DEFAULT 'x',
	SubImage2 varchar2(2000) DEFAULT 'x',
	SubImage3 varchar2(2000) DEFAULT 'x',
	defaultImage varchar2(2000) DEFAULT 'x',
	restaurantIdx number(10) DEFAULT 0
);
-- review_board 별점 추
ALTER TABLE Review_board ADD starCount number(3) DEFAULT 5;

INSERT INTO ADMIN.REVIEW_BOARD
(ARTICLEIDX, HOTPLACEIDX, CONTENTS, nickname, USERTOTALREVIEW, RESTIDX, REGDATE, REVIEWSTAMP, MAINIMAGE)
VALUES(0, 1, 'test', 'test', 0 , '22', sysdate, 0, '22');

UPDATE REVIEW_BOARD SET RESTIDX = 25 WHERE ARTICLEIDX = 0;

SELECT * FROM REVIEW_BOARD WHERE RESTAURANTIDX = 1 order by SYSDATE ;

-- 새롭게 추가되는 review 번호
SELECT NVL(MAX(articleIdx),0)+1 AS articleIdx FROM Review_board;

-- restURL not null 제거 (크롤링용)
ALTER TABLE Review_board ALTER COLUMN resturl varchar(2000);


-- image

DROP TABLE Image_INFO CASCADE CONSTRAINTS;
CREATE TABLE Image_INFO(
	imageFileNo number(10) PRIMARY KEY,	--pk
	imageFileName varchar2(1000) NOT NULL,
	articleIdx number(10),				--fk
	restaurantIdx number(38),			--fk
	regDate DATE DEFAULT sysdate
);

INSERT INTO ADMIN.IMAGE_INFO
(IMAGEFILENO, IMAGEFILENAME, ARTICLEIDX, RESTAURANTIDX, REGDATE)
VALUES(0, '', 0, 0, sysdate
);

-- 총 이미지 갯수가져오기
SELECT count(*) FROM IMAGE_INFO ;


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

-- 매장 전체 정보 조회

SELECT * FROM RESTAURANT_INFO WHERE RESTIDX = 11 ORDER BY RESTIDX  ;

-- 매장 평균 소수점 첫짜리 까지로 변경
-- int -> double 정밀도 변경	 * 변경 요망 *
ALTER TABLE restaurant_info ADD (restStarAvg_backup NUMBER(10));
UPDATE restaurant_info SET restStarAvg_backup =restStarAvg;
UPDATE restaurant_info SET restStarAvg = NULL;
ALTER TABLE restaurant_info modify restStarAvg number(3,1) ;
UPDATE restaurant_info SET restStarAvg = restStarAvg_backup;
ALTER TABLE restaurant_info DROP COLUMN restStarAvg_backup;
-- 매장 조회수 카운트 ++

UPDATE RESTAURANT_INFO SET RESTVISITCOUNT = RESTVISITCOUNT +1 WHERE RESTIDX = 11;
ROLLBACK;
SELECT * FROM RESTAURANT_INFO ri WHERE RESTIDX = 11; 

-- 매장 리뷰 별점 평균
UPDATE RESTAURANT_INFO SET restStarAvg = 3.7 WHERE RESTIDX = 11;

-- 레스토랑 찜 테이블

DROP TABLE restaurant_Jjim CASCADE CONSTRAINTS;
CREATE TABLE restaurant_Jjim(
	JjimNO number(10) PRIMARY KEY, -- pk
	RestaurantIdx number(10) NOT NULL,
	id varchar2(1000) NOT null,
	nickName varchar2(1000) NOT NULL,
	regDate DATE DEFAULT sysdate
);

INSERT INTO restaurant_Jjim
(JjimNO, RestaurantIdx, id, nickName,regDate)
VALUES(2, 33, 'nicednjsdud', '밥', sysdate
);
-- 찜 조회
SELECT count(*) FROM restaurant_Jjim WHERE restaurantIdx = 11 AND id = 'nicednjsdud';
SELECT NVL(MAX(JjimNO),0)+1 AS JjimNO FROM restaurant_Jjim;
-- 찜 삭제
DELETE FROM restaurant_Jjim WHERE restaurantIdx = 11 AND id = 'nicednjsdud';
ROLLBACK;

-- 리뷰 추천해요 테이블

DROP TABLE Review_GoodCheck CASCADE CONSTRAINTS;
CREATE TABLE Review_GoodCheck(
	steamedIdx number(5) PRIMARY KEY,	-- pk
	articleIdx number(10),
	restIdx number(5),
	Id varchar2(1000),
	regDate DATE DEFAULT sysdate
);

INSERT INTO ADMIN.REVIEW_GOODCHECK (STEAMEDIDX, ARTICLEIDX,restIdx, ID) VALUES(2, 10263,11, 'nicednjsdud');

SELECT * FROM Review_GoodCheck WHERE ARTICLEIDX = 11 AND USERID = 'nicednjsdud';

SELECT NVL(MAX(steamedIdx),0)+1 as steamedIdx FROM Review_GoodCheck;

