-- 테이블 생성
CREATE TABLE Users (
	userId	NUMBER(10,0)		NOT NULL,
	id	VARCHAR2(20)		NOT NULL,
	password	VARCHAR2(60)		NOT NULL,
	profile	CLOB		NULL,
	nickname	VARCHAR2(20)		NOT NULL,
	username	VARCHAR2(20)		NOT NULL,
	createdAt	DATE	DEFAULT sysdate	NOT NULL
);

CREATE TABLE Posts (
	postId	NUMBER(10,0)		NOT NULL,
	postContent	CLOB		NULL,
	picture	CLOB		NULL,
	createdAt	DATE	DEFAULT sysdate	NOT NULL,
	updatedAt	DATE		NULL,
	readCount	NUMBER(10,0)	DEFAULT 0	NOT NULL,
	userId	NUMBER(10,0)		NOT NULL
);

CREATE TABLE Hashtag (
	hashtagId	NUMBER(10,0)		NOT NULL,
	hashtag	VARCHAR2(30)		NOT NULL
);

CREATE TABLE Comments (
	commentIndex	NUMBER(10,0)		NOT NULL,
	commentContent	VARCHAR2(256)		NOT NULL,
	createdAt	DATE	DEFAULT sysdate	NOT NULL,
	updatedAt	DATE		NULL,
	postId	NUMBER(10,0)		NOT NULL,
	userId	NUMBER(10,0)		NOT NULL
);

CREATE TABLE Likes (
	likeId	NUMBER(10,0)		NOT NULL,
	userId	NUMBER(10,0)		NOT NULL,
	postId	NUMBER(10,0)		NOT NULL
);

CREATE TABLE Post_hashtag (
	postHashtagId	NUMBER(10,0)		NOT NULL,
	postId	NUMBER(10,0)		NOT NULL,
	hashtagId	NUMBER(10,0)		NOT NULL
);

--제약 조건 추가
ALTER TABLE Users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	userId
);

ALTER TABLE Posts ADD CONSTRAINT PK_POSTS PRIMARY KEY (
	postId
);

ALTER TABLE Hashtag ADD CONSTRAINT PK_HASHTAG PRIMARY KEY (
	hashtagId
);

ALTER TABLE Comments ADD CONSTRAINT PK_COMMENTS PRIMARY KEY (
	commentIndex
);

ALTER TABLE Likes ADD CONSTRAINT PK_LIKES PRIMARY KEY (
	likeId
);

ALTER TABLE Post_hashtag ADD CONSTRAINT PK_POST_HASHTAG PRIMARY KEY (
	postHashtagId
);

ALTER TABLE Images ADD CONSTRAINT PK_IMAGES PRIMARY KEY (
	imageId
);

ALTER TABLE Images ADD CONSTRAINT state_check CHECK( state IN ('profile', 'post'));

--시퀀스 생성
CREATE SEQUENCE seq_posts
  START WITH 10000 INCREMENT BY 1;
  
CREATE SEQUENCE seq_likes
  START WITH 10000 INCREMENT BY 1;
  
  CREATE SEQUENCE seq_post_hashtag
  START WITH 10000 INCREMENT BY 1;
  
  CREATE SEQUENCE seq_hashtag
  START WITH 10000 INCREMENT BY 1;
  
  CREATE SEQUENCE seq_images
  START WITH 10000 INCREMENT BY 1;
  
  CREATE SEQUENCE seq_comments
  START WITH 10000 INCREMENT BY 1;
  
  CREATE SEQUENCE seq_users
  START WITH 10000 INCREMENT BY 1;
  
  
  
insert into users(userid, id, password, nickname,username) 
values (seq_users.nextval, 'kumct12', 'lklk4569', 'hi_wooooany', '이상원');

insert into users(userid, id, password, nickname,username) 
values (seq_users.nextval, 'test', 'test', 'testnickname', '김상구');

insert into users(userid, id, password, nickname,username) 
values (seq_users.nextval, 'test2', 'test2', 'nickTest', '하은영');

insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '겨울은 추워','/resources/image/post-image/a.webp', 10000);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '여름은 더워','/resources/image/post-image/b.webp', 10001);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '가을은 좋아','/resources/image/post-image/c.webp', 10000);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '봄도 좋아','/resources/image/post-image/1.webp', 10002);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '여름이 최고야','/resources/image/post-image/2.webp', 10002);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '겨울은 아파요','/resources/image/post-image/3.jpg', 10001);

insert into hashtag values(seq_hashtag.nextval, '#얼죽코');
insert into hashtag values(seq_hashtag.nextval, '#겨울패션');
insert into hashtag values(seq_hashtag.nextval, '#패딩');
insert into hashtag values(seq_hashtag.nextval, '#트렌디');
insert into hashtag values(seq_hashtag.nextval, '#겨울');
insert into hashtag values(seq_hashtag.nextval, '#하이킹');
insert into hashtag values(seq_hashtag.nextval, '#OOTD');
insert into hashtag values(seq_hashtag.nextval, '#크리스마스');
insert into hashtag values(seq_hashtag.nextval, '#신발');
insert into hashtag values(seq_hashtag.nextval, '#나이키');
insert into hashtag values(seq_hashtag.nextval, '#오뭐입');
insert into hashtag values(seq_hashtag.nextval, '#내뭐입');
insert into hashtag values(seq_hashtag.nextval, '#사랑');

insert into post_hashtag values(seq_post_hashtag.nextval, 10000, 10000);
insert into post_hashtag values(seq_post_hashtag.nextval, 10000, 10001);
insert into post_hashtag values(seq_post_hashtag.nextval, 10000, 10003);
insert into post_hashtag values(seq_post_hashtag.nextval, 10000, 10005);
insert into post_hashtag values(seq_post_hashtag.nextval, 10000, 10012);
insert into post_hashtag values(seq_post_hashtag.nextval, 10002, 10007);
insert into post_hashtag values(seq_post_hashtag.nextval, 10002, 10006);
insert into post_hashtag values(seq_post_hashtag.nextval, 10002, 10002);
insert into post_hashtag values(seq_post_hashtag.nextval, 10002, 10005);
insert into post_hashtag values(seq_post_hashtag.nextval, 10003, 10001);
insert into post_hashtag values(seq_post_hashtag.nextval, 10003, 10010);
insert into post_hashtag values(seq_post_hashtag.nextval, 10004, 10011);
insert into post_hashtag values(seq_post_hashtag.nextval, 10005, 10001);
insert into post_hashtag values(seq_post_hashtag.nextval, 10005, 10001);

commit;
--drop table posts cascade constraints;
--drop table images cascade constraints;
--drop table likes cascade constraints;
--drop table comments cascade constraints;
--drop table hashtag cascade constraints;
--drop table post_hashtag cascade constraints;
--drop table users cascade constraints;
--drop table posts cascade constraints;
select * from post_hashtag a inner join hashtag b on a.hashtagid = b.hashtagid;
