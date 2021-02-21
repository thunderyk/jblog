--------------------------------------------------------
--  파일이 생성됨 - 일요일-2월-21-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORY_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_CATEGORY_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 39 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_COMMENTS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 14 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_POST_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_POST_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 36 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS_NO
--------------------------------------------------------

   CREATE SEQUENCE  "JBLOG"."SEQ_USERS_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BLOG
--------------------------------------------------------

  CREATE TABLE "JBLOG"."BLOG" 
   (	"ID" VARCHAR2(50 BYTE), 
	"BLOGTITLE" VARCHAR2(200 BYTE), 
	"LOGOFILE" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "JBLOG"."CATEGORY" 
   (	"CATENO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"CATENAME" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."COMMENTS" 
   (	"CMTNO" NUMBER, 
	"POSTNO" NUMBER, 
	"USERNO" NUMBER, 
	"CMTCONTENT" VARCHAR2(1000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "JBLOG"."POST" 
   (	"POSTNO" NUMBER, 
	"CATENO" NUMBER, 
	"POSTTITLE" VARCHAR2(300 BYTE), 
	"POSTCONTENT" VARCHAR2(4000 BYTE), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "JBLOG"."USERS" 
   (	"USERNO" NUMBER, 
	"ID" VARCHAR2(50 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"JOINDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into JBLOG.BLOG
SET DEFINE OFF;
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('aa','aa의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rr','rr의 블로그입니다.','1613712097567a0c2e1a0-4549-4c6b-a67c-c372992f53cb.jpg');
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yy','yy의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('tt','aa의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrrrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrrrrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrrrrrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('rrrrrrrr','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('cccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('cccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ccccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('cccccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ccccccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('cccccccccc','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('fff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('fffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ffffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('fffffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ffffffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('fffffffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('ffffffffff','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yyy','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yyyy','rr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yyyyyy','rrrrr의 블로그 입니다.',null);
Insert into JBLOG.BLOG (ID,BLOGTITLE,LOGOFILE) values ('yyyyy','rr의 블로그 입니다.',null);
REM INSERTING into JBLOG.CATEGORY
SET DEFINE OFF;
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (1,'rr','미분류','기본',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (2,'yy','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (3,'aa','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (8,'rr','asdfasf','asdfasf',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (10,'rr','xxxxx','xxxx',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (9,'rr','asdfasfdasdf','asdfasfsdfsdff',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (11,'rrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (15,'rrrrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (13,'tt','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (14,'rrrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (16,'rrrrrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (17,'rrrrrrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (18,'rrrrrrrr','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (19,'ccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (20,'cccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (21,'ccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (22,'cccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (23,'ccccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (24,'cccccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (25,'ccccccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (26,'cccccccccc','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (27,'fff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (28,'ffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (29,'fffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (30,'ffffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (31,'fffffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (32,'ffffffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (33,'fffffffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (34,'ffffffffff','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (35,'yyy','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (36,'yyyy','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (37,'yyyyyy','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.CATEGORY (CATENO,ID,CATENAME,DESCRIPTION,REGDATE) values (38,'yyyyy','미분류','기본으로 만들어지는 카테고리 입니다.',to_date('21/02/21','RR/MM/DD'));
REM INSERTING into JBLOG.COMMENTS
SET DEFINE OFF;
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (3,35,6,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (4,35,6,'bbbbbbbbbbbbbbbbbbbbbbbb',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (5,30,6,'ddddddddddddddddddddd',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (6,35,6,'qqqqqqqqqqqqqqqq',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (7,35,6,'qqqqqqqqqqqqqqqqeeeee',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (8,35,6,'1111',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (9,35,6,'22222222222222233333333333',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.COMMENTS (CMTNO,POSTNO,USERNO,CMTCONTENT,REGDATE) values (13,35,15,'asdfasfd',to_date('21/02/21','RR/MM/DD'));
REM INSERTING into JBLOG.POST
SET DEFINE OFF;
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (1,1,'qq','qq',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (2,1,'aa','qq',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (3,1,'bb','qq',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (4,1,'cc','qq',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (5,1,'dd','qq',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (6,10,'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv','vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (7,10,'eeeeeeeeeeeeeeeeeeeeee','eeeeeeeeeeeeeeeeeeeeeeeeeeeee',to_date('21/02/19','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (8,10,'fasdfasfd','asdfasdf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (9,10,'sfwefwef','fwefwefwfw',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (10,10,'ewfwefwef','wefwefwef',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (11,10,'f23f23f123','f213f23f2f2f2f',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (12,10,'4522f34ffdfasf','134f34f132f4',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (13,10,'ewfdsafsfdasf','ff3rf45g2g245g2',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (14,10,'asdfsadasd','fsadfasdfa',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (15,10,'asfasdfas','asdfasdf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (16,10,'asdfasfasf','safdasfdsf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (17,10,'f3ff434f23f234f','234f23f423f2344f',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (18,10,'234f234f23f23f','34frf2fr2f',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (19,10,'24f234f23f423f','324f32ffe',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (20,10,'23f23fe23ef2','2f2f2f2f2',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (21,10,'dfsfsdf','sdfsdfsdf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (22,10,'frf4fr4rf4','4rf4fr4f',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (23,10,'asdfasfasf','adfasfdsaf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (24,10,'asdfsadf','asdfasfsaf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (25,10,'adsfasf','afdasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (26,10,'asdfasdfasf','afasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (27,10,'asdfasdfas','asdfasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (28,10,'asdfasfasf','asfdasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (29,10,'asdfasfas','fasdfasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (30,10,'asdfasfas','asfasfdasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (31,10,'asfdsafas','fasdfsaf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (32,10,'asdfasf','asfdsafasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (33,10,'asfdasfas','fasfdasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (34,10,'asdfsafdsadfsa','fsafasfasf',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.POST (POSTNO,CATENO,POSTTITLE,POSTCONTENT,REGDATE) values (35,10,'asdfsaf','asfdasfsaf',to_date('21/02/20','RR/MM/DD'));
REM INSERTING into JBLOG.USERS
SET DEFINE OFF;
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (8,'aa','aa','aa',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (6,'rr','rr','rr',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (7,'yy','yy','yy',to_date('21/02/18','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (15,'rrr','rr','rrrrrrrr',to_date('21/02/20','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (16,'aaaaaa','aa','aaaaaaaa',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (17,'tt','aa','tttttttt',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (18,'rrrr','rr','rrrrrrrr',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (19,'rrrrr','rr','rrrrrrrr',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (20,'rrrrrr','rr','rrrrrrrr',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (21,'rrrrrrr','rr','rrrrrrrr',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (22,'rrrrrrrr','rr','rrrrrrrr',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (23,'ccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (24,'cccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (25,'ccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (26,'cccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (27,'ccccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (28,'cccccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (29,'ccccccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (30,'cccccccccc','rr','cccccccc',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (31,'fff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (32,'ffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (33,'fffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (34,'ffffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (35,'fffffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (36,'ffffffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (37,'fffffffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (38,'ffffffffff','rr','ffffffff',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (39,'yyy','rr','yyyyyyyy',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (40,'yyyy','rr','yyyyyyyy',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (41,'yyyyyy','rrrrr','yyyyyyyy',to_date('21/02/21','RR/MM/DD'));
Insert into JBLOG.USERS (USERNO,ID,USERNAME,PASSWORD,JOINDATE) values (42,'yyyyy','rr','yyyyyyyy',to_date('21/02/21','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD PRIMARY KEY ("CMTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."COMMENTS" MODIFY ("CMTCONTENT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD PRIMARY KEY ("CATENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."CATEGORY" MODIFY ("CATENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD PRIMARY KEY ("POSTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."POST" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."POST" MODIFY ("POSTTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."USERS" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" ADD PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."USERS" MODIFY ("JOINDATE" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "JBLOG"."USERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JBLOG"."BLOG" MODIFY ("BLOGTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BLOG
--------------------------------------------------------

  ALTER TABLE "JBLOG"."BLOG" ADD CONSTRAINT "FK_BLOG" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "JBLOG"."CATEGORY" ADD CONSTRAINT "FK_CATEGORY" FOREIGN KEY ("ID")
	  REFERENCES "JBLOG"."BLOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "JBLOG"."COMMENTS" ADD CONSTRAINT "FK_USERNO_USERS" FOREIGN KEY ("USERNO")
	  REFERENCES "JBLOG"."USERS" ("USERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "JBLOG"."POST" ADD CONSTRAINT "FK_POST" FOREIGN KEY ("CATENO")
	  REFERENCES "JBLOG"."CATEGORY" ("CATENO") ENABLE;
