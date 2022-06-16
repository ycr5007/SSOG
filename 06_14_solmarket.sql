-- user테이블 칼럼추가
-- req_auth : 권한요청(SELLER : 1 / MANAGER : 2)
ALTER TABLE myuser add req_auth number(2) default 0;
select * from myuser;
-- 권한요청 테이블 추가
CREATE TABLE auth_request(
	user_id VARCHAR2(12) NOT NULL,
	authority varchar2(50) NOT NULL
);



ALTER TABLE auth_request ADD constraint FK_REQ_AUTH foreign key(user_id) references myuser(user_id) ON DELETE CASCADE;

-- 테이블 추가
CREATE TABLE recruit_img (
	uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    market_no number(10, 0)
);
alter table recruit_img add constraint PK_RECRUIT_IMG primary key(uuid);
ALTER TABLE recruit_img ADD CONSTRAINT FK_RECRUIT_IMG FOREIGN KEY(market_no) REFERENCES market(market_no) ON DELETE CASCADE;

-------------------------------------------------------------------------------------------------------------------------
-- 방문자 테이블
create table visitor(
	visit_id number,
	visit_time date default sysdate,
	session_id varchar2(100) not null unique
);

alter table visitor add constraint PK_VISITOR primary key(visit_id);

select * from myuser;
create table visitor_total(
    visit_date Date not null,
    visit_total number(8) not null
);


-- 유저 테이블 --
CREATE TABLE myuser (
	user_no NUMBER NOT NULL,
	user_id VARCHAR2(12) NOT NULL UNIQUE,
	user_pw VARCHAR2(100) NOT NULL,
	user_name NVARCHAR2(8) NOT NULL,
	user_mail VARCHAR2(38) NOT NULL,
    user_phone VARCHAR2(20) NOT NULL,
    user_address NVARCHAR2(128) NOT NULL,
	user_profile NVARCHAR2(50),
	user_status NUMBER(2) DEFAULT 1,
    enabled CHAR(1) DEFAULT '1'
);


ALTER TABLE myuser ADD CONSTRAINT PK_USER PRIMARY KEY (user_no);

CREATE TABLE myuser_auth(
   user_id VARCHAR2(12) not null,
   authority varchar2(50) not null
);
ALTER TABLE myuser_auth ADD constraint FK_USER_AUTH foreign key(user_id) references myuser(user_id) ON DELETE CASCADE;

create table user_img(
    uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    user_no number(10, 0)
);

alter table user_img add constraint PK_USER_IMG primary key(uuid);
alter table user_img add constraint FK_USER_NO foreign key(user_no) references myUser(user_no) ON DELETE CASCADE;

-- 장터 테이블 --
CREATE TABLE market (
	market_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_name NVARCHAR2(20) NOT NULL,
	market_loc VARCHAR2(128) NOT NULL,
	market_sd DATE NOT NULL,
	market_ed DATE NOT NULL,
	market_rate NUMBER DEFAULT 0.0,
	market_status NUMBER(2) DEFAULT 0
);

ALTER TABLE market ADD CONSTRAINT PK_MARKET PRIMARY KEY (market_no);
ALTER TABLE market ADD CONSTRAINT FK_MARKET_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no) ON DELETE CASCADE;

CREATE TABLE market_img (
	uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    market_no number(10, 0)
);
alter table market_img add constraint PK_MARKET_IMG primary key(uuid);
ALTER TABLE market_img ADD CONSTRAINT FK_MARKET_IMG FOREIGN KEY(market_no) REFERENCES market(market_no) ON DELETE CASCADE;

-- 공지사항 테이블 --
CREATE TABLE notice (
	notice_no	NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	notice_title VARCHAR2(128) NOT NULL,
	notice_content VARCHAR2(1024) NOT NULL,
	notice_date DATE	DEFAULT sysdate,
	notice_category VARCHAR2(10) NOT NULL,
    notice_status NUMBER(2) DEFAULT 0
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (notice_no);
ALTER TABLE notice ADD CONSTRAINT FK_NOTICE_MARKET FOREIGN KEY(market_no) REFERENCES market(market_no)  ON DELETE CASCADE;

CREATE TABLE notice_img (
	uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    notice_no number(10, 0)
);
alter table notice_img add constraint PK_NOTICE_IMG primary key(uuid);
ALTER TABLE notice_img ADD CONSTRAINT FK_NOTICE_IMG FOREIGN KEY(notice_no) REFERENCES notice(notice_no) ON DELETE CASCADE;

-- 게시판 테이블 --
CREATE TABLE board (
	board_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	board_title VARCHAR2(128) NOT NULL,
	board_content VARCHAR2(1024) NOT NULL,
	board_date DATE DEFAULT sysdate,
	board_hit NUMBER DEFAULT 0,
	board_repl NUMBER DEFAULT 0
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (board_no);

CREATE TABLE board_img (
	uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    board_no number(10, 0)
);
alter table board_img add constraint PK_BOARD_IMG primary key(uuid);
ALTER TABLE board_img ADD CONSTRAINT FK_BOARD_IMG FOREIGN KEY (board_no) REFERENCES board(board_no)  ON DELETE CASCADE;

-- 댓글

CREATE TABLE reply (
	reply_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	board_no NUMBER	 NOT NULL,
	reply_content VARCHAR2(512) NOT NULL,
	reply_date DATE DEFAULT sysdate
);

ALTER TABLE reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (reply_no);
ALTER TABLE reply ADD CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(board_no) REFERENCES board(board_no)  ON DELETE CASCADE;

-- 리뷰 테이블 --
CREATE TABLE review(
	review_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	review_content VARCHAR2(512) NOT NULL,
	review_date DATE DEFAULT sysdate,
    review_status NUMBER(2) DEFAULT 1,
	review_rate NUMBER(2) NOT NULL
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (review_no);
ALTER TABLE review ADD CONSTRAINT FK_REVIEW_MARKET FOREIGN KEY(market_no) REFERENCES market(market_no) ON DELETE CASCADE;

-- 카테고리 테이블 --
CREATE TABLE category (
	category_no NUMBER NOT NULL,
	category_name VARCHAR2(32) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (category_no);

-- 상품 테이블 --
CREATE TABLE product (
	product_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	category_no NUMBER NOT NULL,
	product_name NVARCHAR2(20) NOT NULL,
    product_content NVARCHAR2(512) NOT NULL,
	product_qn NUMBER(4) NOT NULL,
	product_price NUMBER(16) NOT NULL,
    product_date DATE DEFAULT SYSDATE,
    product_sale NUMBER(4),
	product_status NUMBER(2) DEFAULT 0
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_MARKET FOREIGN KEY(market_no) REFERENCES market(market_no) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY(category_no) REFERENCES category(category_no) ON DELETE CASCADE;

CREATE TABLE product_img(
	uuid varchar2(100) not null,
    uploadpath varchar2(200) not null,
    filename varchar2(100) not null,
    product_no number(10, 0)
);
alter table product_img add constraint PK_PRODUCT_IMG primary key(uuid);
ALTER TABLE product_img ADD CONSTRAINT FK_PRODUCT_IMG FOREIGN KEY(product_no) REFERENCES product(product_no);

-- 장바구니 테이블 --
CREATE TABLE cart (
	cart_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	product_no NUMBER NOT NULL,
	cart_qn NUMBER(4) NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT FK_CART_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT FK_CART_PRODUCT FOREIGN KEY(product_no) REFERENCES product(product_no) ON DELETE CASCADE;

-- 주문 테이블 --
CREATE TABLE myorder(
	order_no NUMBER NOT NULL,
	product_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	order_qn NUMBER(4) NOT NULL,
	order_pay NUMBER(16) NOT NULL,
	order_send VARCHAR2(128) NOT NULL
);

ALTER TABLE myorder ADD CONSTRAINT PK_ORDER PRIMARY KEY (order_no);
ALTER TABLE myorder ADD CONSTRAINT FK_ORDER_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE myorder ADD CONSTRAINT FK_ORDER_PRODUCT FOREIGN KEY(product_no) REFERENCES product(product_no);

-- 배송 테이블 --
CREATE TABLE delivery(
	delivery_no NUMBER NOT NULL,
	order_no NUMBER NOT NULL,
	delivery_sendno VARCHAR2(16) NOT NULL,
	delivery_status VARCHAR(255) DEFAULT 0
);

ALTER TABLE delivery ADD CONSTRAINT PK_DELIVERY PRIMARY KEY (delivery_no);
ALTER TABLE delivery ADD CONSTRAINT FK_DELIVERY_ORDER FOREIGN KEY(order_no) REFERENCES myorder(order_no);


-------------------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE myUser_seq;
CREATE SEQUENCE notice_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE reply_seq;
CREATE SEQUENCE market_seq;
CREATE SEQUENCE review_seq;
CREATE SEQUENCE product_seq;
CREATE SEQUENCE myOrder_seq;
CREATE SEQUENCE delivery_seq;
CREATE SEQUENCE cart_seq;
CREATE SEQUENCE visitor_seq;

-- 카테고리 샘플 데이터 
insert into category values(1, '패션잡화');
insert into category values(2, '의류');
insert into category values(3, '푸드');
insert into category values(4, '캔들/디퓨저/방향제');
insert into category values(5, '문구/팬시');
insert into category values(6, '향수/화장품/뷰티');
insert into category values(7, '기타');
