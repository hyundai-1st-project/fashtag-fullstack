-- ���̺� ����
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

CREATE TABLE persistent_logins (
                                   series VARCHAR(64) PRIMARY KEY,
                                   username VARCHAR(64) NOT NULL,
                                   token VARCHAR(64) NOT NULL,
                                   last_used TIMESTAMP NOT NULL
);

create table auth(
                     userId NUMBER(10,0) NOT NULL,
                     auth varchar2(50) NOT NULL,
                     constraint fk_auth foreign key(userId) references users
);

--���� ���� �߰�
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

--������ ����
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
values (seq_users.nextval, 'kumct12', 'lklk4569', 'hi_wooooany', '�̻��');

insert into users(userid, id, password, nickname,username) 
values (seq_users.nextval, 'test', 'test', 'testnickname', '���');

insert into users(userid, id, password, nickname,username) 
values (seq_users.nextval, 'test2', 'test2', 'nickTest', '������');

insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '�ܿ��� �߿�','/resources/image/post-image/a.webp', 10000);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '������ ����','/resources/image/post-image/b.webp', 10001);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '������ ����','/resources/image/post-image/c.webp', 10000);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '���� ����','/resources/image/post-image/1.webp', 10002);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '������ �ְ��','/resources/image/post-image/2.webp', 10002);
insert into posts(postid, POSTCONTENT, picture,USERID) values (seq_posts.nextval, '�ܿ��� ���Ŀ�','/resources/image/post-image/3.jpg', 10001);

insert into hashtag values(seq_hashtag.nextval, '#������');
insert into hashtag values(seq_hashtag.nextval, '#�ܿ��м�');
insert into hashtag values(seq_hashtag.nextval, '#�е�');
insert into hashtag values(seq_hashtag.nextval, '#Ʈ����');
insert into hashtag values(seq_hashtag.nextval, '#�ܿ�');
insert into hashtag values(seq_hashtag.nextval, '#����ŷ');
insert into hashtag values(seq_hashtag.nextval, '#OOTD');
insert into hashtag values(seq_hashtag.nextval, '#ũ��������');
insert into hashtag values(seq_hashtag.nextval, '#�Ź�');
insert into hashtag values(seq_hashtag.nextval, '#����Ű');
insert into hashtag values(seq_hashtag.nextval, '#������');
insert into hashtag values(seq_hashtag.nextval, '#������');
insert into hashtag values(seq_hashtag.nextval, '#���');

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
insert into post_hashtag values(seq_post_hashtag.nextval, 10005, 10012);

insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10000, 10002); 
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10000, 10005);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10000, 10003);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10000, 10001);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10001, 10002);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10001, 10004);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10001, 10005);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10000);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10001);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10002);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10003);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10004);
insert into likes(likeid,userid,postid) values (seq_likes.nextval, 10002, 10005);

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
