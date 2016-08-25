--create user arctic identified by arctic;
--grant connect, resource, unlimited tablespace to arctic;
--GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO arctic IDENTIFIED BY arctic;
--ALTER USER arctic DEFAULT TABLESPACE USERS;
--ALTER USER arctic TEMPORARY TABLESPACE TEMP;
--CONNECT arctic/arctic
--jdbc:oracle:thin:@(description=(address_list=(address=(protocol=TCP)(host=112.217.150.33)(port=1521)))(connect_data=(service_name=XE)))

create table member (
    userid varchar2(60),
    userpw varchar2(20) NOT NULL,
    name varchar2(20) NOT NULL,
    mobile varchar2(20),
    email varchar2(100),
    constraint PK_ARCTIC_USER PRIMARY KEY(userid)
);
INSERT INTO member VALUES ('nmsc','goqld1357!','Administrator','010-1245-1245','seaice@korea.kr');

CREATE TABLE authorities (
  userid VARCHAR2(60) NOT NULL,
  authority VARCHAR2(20) NOT NULL,
  CONSTRAINT fk_authorities FOREIGN KEY(userid) REFERENCES member(userid)
);

CREATE UNIQUE INDEX ix_authorities ON authorities(userid,authority); 
INSERT INTO authorities VALUES ('nmsc','ROLE_ADMIN');
INSERT INTO authorities VALUES ('nmsc','ROLE_USER');


create table board (
    boardcd varchar2(20),
    boardnm varchar2(40) NOT NULL,
    constraint PK_BOARD PRIMARY KEY(boardcd)
);

create table article (
    articleno number,
    boardcd varchar2(20),
    title varchar2(200) NOT NULL,
    content clob NOT NULL,
    userid varchar2(60),
    hit number,    
    regdate date,
    constraint PK_ARTICLE PRIMARY KEY(articleno),
    constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

create sequence SEQ_ARTICLE
increment by 1
start with 1;

create table comments (
    commentno number,
    articleno number,    
    userid varchar2(60),    
    memo varchar2(4000) NOT NULL,
    regdate date, 
    constraint PK_COMMENTS PRIMARY KEY(commentno)
);

create sequence SEQ_COMMENTS
    increment by 1
    start with 1;

create table attachfile (
    attachfileno number,
    filename varchar2(50) NOT NULL,
    filetype varchar2(30),
    filesize number,
    articleno number,
    userid varchar2(60),
    constraint PK_ATTACHFILE PRIMARY KEY(attachfileno));

create sequence SEQ_ATTACHFILE
increment by 1
start with 1;

insert into board values ('notice','공지사항');
insert into board values ('refs','참고자료');
insert into board values ('anal','분석정보');

Insert into article (articleNo, boardCd, title, content, userid, hit, regdate) values (seq_article.nextval, 'notice', 'NOTICE 01', 'contents goes here', 'nmsc', 0, sysdate);
Insert into article (articleNo, boardCd, title, content, userid, hit, regdate) values (seq_article.nextval, 'notice', 'NOTICE 02', 'contents goes here', 'nmsc', 0, sysdate);
Insert into article (articleNo, boardCd, title, content, userid, hit, regdate) values (seq_article.nextval, 'notice', 'NOTICE 03', 'contents goes here', 'nmsc', 0, sysdate);
Insert into article (articleNo, boardCd, title, content, userid, hit, regdate) values (seq_article.nextval, 'notice', 'NOTICE 04', 'contents goes here', 'nmsc', 0, sysdate);
Insert into article (articleNo, boardCd, title, content, userid, hit, regdate) values (seq_article.nextval, 'notice', 'NOTICE 05', 'contents goes here', 'nmsc', 0, sysdate);

create table data_up2date(
	id varchar2(5),
	lateststuff varchar2(8) not null,
	description varchar2(100) not null,
	beginat date not null,
	seeker_run_at date default sysdate, 
	constraint PK_DATA_CREATION_INFO PRIMARY KEY(id)
);

INSERT INTO data_up2date VALUES ('01CON','20120813','concentration',to_date('01-01-2007','mm-dd-yyyy'), sysdate);
INSERT INTO data_up2date VALUES ('02PRE','201508','prediction', to_date('06-2015','mm-yyyy'), sysdate);
INSERT INTO data_up2date VALUES ('03PAS','20120813','passage', to_date('01-01-2007','mm-dd-yyyy'), sysdate);


create sequence SEQ_TIMESERIES increment by 1 start with 1;

create table timeseries(
	seriesno number,
	compbegindate date,
	extent number,
	roughness number,
	ocean01 number,
	ocean02 number,
	ocean03 number,
	constraint PK_TIMESERIES primary key(seriesno)
);	

/**
 * timeseriesUpsertRunner.java
 * */
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-01-01','YYYY-MM-DD'), 14.2006, 0.473341 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-01-08','YYYY-MM-DD'), 14.3694, 0.471682 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-01-15','YYYY-MM-DD'), 14.6687, 0.483604 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-01-22','YYYY-MM-DD'), 14.8081, 0.479276 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-01-29','YYYY-MM-DD'), 14.9475, 0.474948 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-02-05','YYYY-MM-DD'), 15.3038, 0.470002 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-02-12','YYYY-MM-DD'), 15.5688, 0.493757 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-02-19','YYYY-MM-DD'), 15.7688, 0.485316 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-02-26','YYYY-MM-DD'), 15.8219, 0.480802 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-03-05','YYYY-MM-DD'), 15.4725, 0.480632 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-03-12','YYYY-MM-DD'), 15.6637, 0.48569 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-03-19','YYYY-MM-DD'), 15.3794, 0.47459 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-03-26','YYYY-MM-DD'), 15.3669, 0.461253 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-04-02','YYYY-MM-DD'), 15.14, 0.469932 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-04-09','YYYY-MM-DD'), 14.7269, 0.471007 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-04-16','YYYY-MM-DD'), 14.5319, 0.466954 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-04-23','YYYY-MM-DD'), 14.3713, 0.463064 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-04-30','YYYY-MM-DD'), 14.0581, 0.477494 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-05-07','YYYY-MM-DD'), 13.6987, 0.478473 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-05-14','YYYY-MM-DD'), 13.4381, 0.459102 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-05-21','YYYY-MM-DD'), 13.1919, 0.451575 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-05-28','YYYY-MM-DD'), 12.885, 0.433795 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-06-04','YYYY-MM-DD'), 12.3287, 0.419091 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-06-11','YYYY-MM-DD'), 12.0387, 0.400185 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-06-18','YYYY-MM-DD'), 11.6175, 0.366952 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-06-25','YYYY-MM-DD'), 10.8906, 0.358785 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-07-02','YYYY-MM-DD'), 9.59625, 0.351219 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-07-09','YYYY-MM-DD'), 8.63625, 0.351721 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-07-16','YYYY-MM-DD'), 7.73, 0.344333 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-07-23','YYYY-MM-DD'), 7.3175, 0.340499 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-07-30','YYYY-MM-DD'), 6.86312, 0.335695 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-08-06','YYYY-MM-DD'), 6.1625, 0.339306 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-08-13','YYYY-MM-DD'), 5.67125, 0.32351 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-08-20','YYYY-MM-DD'), 5.1825, 0.335344 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-08-27','YYYY-MM-DD'), 4.96562, 0.35725 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-09-03','YYYY-MM-DD'), 4.7575, 0.36142 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-09-10','YYYY-MM-DD'), 4.65625, 0.366547 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-09-17','YYYY-MM-DD'), 4.62687, 0.376108 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-09-24','YYYY-MM-DD'), 4.78188, 0.371563 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-10-01','YYYY-MM-DD'), 5.32, 0.370285 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-10-08','YYYY-MM-DD'), 5.82375, 0.38462 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-10-15','YYYY-MM-DD'), 6.7375, 0.379302 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-10-22','YYYY-MM-DD'), 8.12, 0.382937 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-10-29','YYYY-MM-DD'), 9.14937, 0.419891 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-11-05','YYYY-MM-DD'), 9.845, 0.436845 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-11-12','YYYY-MM-DD'), 10.2356, 0.441783 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-11-19','YYYY-MM-DD'), 10.8287, 0.446072 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-11-26','YYYY-MM-DD'), 11.5375, 0.441739 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-12-03','YYYY-MM-DD'), 12.0162, 0.431756 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-12-10','YYYY-MM-DD'), 12.4338, 0.4509 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-12-17','YYYY-MM-DD'), 13.0575, 0.474053 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2007-12-24','YYYY-MM-DD'), 13.685, 0.473154 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-01-01','YYYY-MM-DD'), 14.0837, 0.481661 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-01-08','YYYY-MM-DD'), 14.5425, 0.488304 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-01-15','YYYY-MM-DD'), 14.9125, 0.475644 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-01-22','YYYY-MM-DD'), 15.4187, 0.465986 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-01-29','YYYY-MM-DD'), 15.6856, 0.478068 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-02-05','YYYY-MM-DD'), 15.8562, 0.484917 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-02-12','YYYY-MM-DD'), 16.2488, 0.469666 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-02-19','YYYY-MM-DD'), 16.2519, 0.470471 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-02-26','YYYY-MM-DD'), 16.4181, 0.484283 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-03-05','YYYY-MM-DD'), 16.3162, 0.486389 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-03-12','YYYY-MM-DD'), 16.3213, 0.48788 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-03-19','YYYY-MM-DD'), 16.1969, 0.48396 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-03-26','YYYY-MM-DD'), 16.0725, 0.480039 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-04-02','YYYY-MM-DD'), 15.7675, 0.478517 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-04-09','YYYY-MM-DD'), 15.5125, 0.488665 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-04-16','YYYY-MM-DD'), 14.9875, 0.475138 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-04-23','YYYY-MM-DD'), 14.5706, 0.471091 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-04-30','YYYY-MM-DD'), 14.4181, 0.479297 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-05-07','YYYY-MM-DD'), 13.9412, 0.479198 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-05-14','YYYY-MM-DD'), 13.62, 0.461848 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-05-21','YYYY-MM-DD'), 13.2819, 0.438548 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-05-28','YYYY-MM-DD'), 12.8075, 0.439074 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-06-04','YYYY-MM-DD'), 12.25, 0.425368 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-06-11','YYYY-MM-DD'), 11.8575, 0.412736 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-06-18','YYYY-MM-DD'), 11.38, 0.393485 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-06-25','YYYY-MM-DD'), 10.8075, 0.373779 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-07-02','YYYY-MM-DD'), 10.07, 0.362736 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-07-09','YYYY-MM-DD'), 9.50125, 0.345299 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-07-16','YYYY-MM-DD'), 8.8525, 0.345494 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-07-23','YYYY-MM-DD'), 8.10125, 0.344444 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-07-30','YYYY-MM-DD'), 7.55062, 0.331043 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-08-06','YYYY-MM-DD'), 6.945, 0.325019 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-08-13','YYYY-MM-DD'), 6.36688, 0.32643 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-08-20','YYYY-MM-DD'), 5.865, 0.336128 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-08-27','YYYY-MM-DD'), 5.37375, 0.334222 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-09-03','YYYY-MM-DD'), 5.11, 0.332491 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-09-10','YYYY-MM-DD'), 5.05875, 0.340305 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-09-17','YYYY-MM-DD'), 5.02125, 0.342922 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-09-24','YYYY-MM-DD'), 5.315, 0.358535 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-10-01','YYYY-MM-DD'), 6.1675, 0.361123 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-10-08','YYYY-MM-DD'), 7.2825, 0.360158 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-10-15','YYYY-MM-DD'), 8.32375, 0.378466 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-10-22','YYYY-MM-DD'), 9.21625, 0.398773 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-10-29','YYYY-MM-DD'), 9.89937, 0.41825 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-11-05','YYYY-MM-DD'), 10.4513, 0.446142 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-11-12','YYYY-MM-DD'), 10.6975, 0.455317 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-11-19','YYYY-MM-DD'), 11.3112, 0.46217 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-11-26','YYYY-MM-DD'), 11.8625, 0.479063 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-12-03','YYYY-MM-DD'), 12.7344, 0.470244 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-12-10','YYYY-MM-DD'), 12.99, 0.455718 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-12-17','YYYY-MM-DD'), 12.9331, 0.466115 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2008-12-24','YYYY-MM-DD'), 13.7331, 0.474761 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-01-01','YYYY-MM-DD'), 14.0981, 0.469984 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-01-08','YYYY-MM-DD'), 14.6825, 0.471021 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-01-15','YYYY-MM-DD'), 15.1663, 0.472911 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-01-22','YYYY-MM-DD'), 15.2137, 0.477808 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-01-29','YYYY-MM-DD'), 15.5156, 0.481408 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-02-05','YYYY-MM-DD'), 15.7219, 0.486736 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-02-12','YYYY-MM-DD'), 16.025, 0.492535 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-02-19','YYYY-MM-DD'), 15.9581, 0.481036 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-02-26','YYYY-MM-DD'), 16.1419, 0.483689 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-03-05','YYYY-MM-DD'), 16.2488, 0.485229 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-03-12','YYYY-MM-DD'), 16.1012, 0.484877 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-03-19','YYYY-MM-DD'), 16.1131, 0.491872 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-03-26','YYYY-MM-DD'), 15.8287, 0.491939 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-04-02','YYYY-MM-DD'), 15.6506, 0.494187 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-04-09','YYYY-MM-DD'), 15.4244, 0.482735 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-04-16','YYYY-MM-DD'), 15.22, 0.47914 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-04-23','YYYY-MM-DD'), 14.9381, 0.473153 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-04-30','YYYY-MM-DD'), 14.6881, 0.474923 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-05-07','YYYY-MM-DD'), 14.2638, 0.484821 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-05-14','YYYY-MM-DD'), 13.9131, 0.469955 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-05-21','YYYY-MM-DD'), 13.4563, 0.459178 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-05-28','YYYY-MM-DD'), 12.9925, 0.443893 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-06-04','YYYY-MM-DD'), 12.2075, 0.448996 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-06-11','YYYY-MM-DD'), 11.9869, 0.438962 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-06-18','YYYY-MM-DD'), 11.6187, 0.428933 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-06-25','YYYY-MM-DD'), 11.0275, 0.410624 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-07-02','YYYY-MM-DD'), 10.1538, 0.390579 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-07-09','YYYY-MM-DD'), 9.49438, 0.353967 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-07-16','YYYY-MM-DD'), 8.7075, 0.339781 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-07-23','YYYY-MM-DD'), 7.81313, 0.353261 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-07-30','YYYY-MM-DD'), 7.32562, 0.344105 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-08-06','YYYY-MM-DD'), 6.96875, 0.351725 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-08-13','YYYY-MM-DD'), 6.59125, 0.348388 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-08-20','YYYY-MM-DD'), 6.05813, 0.358937 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-08-27','YYYY-MM-DD'), 5.7325, 0.356059 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-09-03','YYYY-MM-DD'), 5.59, 0.353661 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-09-10','YYYY-MM-DD'), 5.5625, 0.353023 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-09-17','YYYY-MM-DD'), 5.78813, 0.355874 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-09-24','YYYY-MM-DD'), 5.90188, 0.349532 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-10-01','YYYY-MM-DD'), 6.31938, 0.351879 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-10-08','YYYY-MM-DD'), 7.0675, 0.354905 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-10-15','YYYY-MM-DD'), 7.6325, 0.3631 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-10-22','YYYY-MM-DD'), 8.36438, 0.395066 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-10-29','YYYY-MM-DD'), 9.16438, 0.40645 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-11-05','YYYY-MM-DD'), 9.54125, 0.432523 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-11-12','YYYY-MM-DD'), 10.24, 0.420623 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-11-19','YYYY-MM-DD'), 10.9175, 0.457502 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-11-26','YYYY-MM-DD'), 11.645, 0.457068 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-12-03','YYYY-MM-DD'), 12.3556, 0.444366 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-12-10','YYYY-MM-DD'), 12.7994, 0.45087 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-12-17','YYYY-MM-DD'), 13.1706, 0.453621 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2009-12-24','YYYY-MM-DD'), 13.61, 0.452959 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-01-01','YYYY-MM-DD'), 14.1587, 0.458253 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-01-08','YYYY-MM-DD'), 14.425, 0.463902 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-01-15','YYYY-MM-DD'), 14.6556, 0.469755 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-01-22','YYYY-MM-DD'), 14.88, 0.454535 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-01-29','YYYY-MM-DD'), 15.0463, 0.466144 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-02-05','YYYY-MM-DD'), 15.37, 0.478215 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-02-12','YYYY-MM-DD'), 15.64, 0.482114 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-02-19','YYYY-MM-DD'), 15.6994, 0.485383 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-02-26','YYYY-MM-DD'), 15.8713, 0.488 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-03-05','YYYY-MM-DD'), 16.0725, 0.483463 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-03-12','YYYY-MM-DD'), 16.04, 0.488469 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-03-19','YYYY-MM-DD'), 15.99, 0.486322 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-03-26','YYYY-MM-DD'), 16.0713, 0.474896 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-04-02','YYYY-MM-DD'), 15.9012, 0.482262 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-04-09','YYYY-MM-DD'), 15.72, 0.473378 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-04-16','YYYY-MM-DD'), 15.195, 0.471234 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-04-23','YYYY-MM-DD'), 15.0156, 0.463335 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-04-30','YYYY-MM-DD'), 14.7375, 0.458815 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-05-07','YYYY-MM-DD'), 14.0688, 0.452961 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-05-14','YYYY-MM-DD'), 13.5481, 0.445448 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-05-21','YYYY-MM-DD'), 12.965, 0.440818 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-05-28','YYYY-MM-DD'), 12.5831, 0.435177 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-06-04','YYYY-MM-DD'), 11.9225, 0.431866 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-06-11','YYYY-MM-DD'), 11.3075, 0.427372 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-06-18','YYYY-MM-DD'), 10.6556, 0.395959 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-06-25','YYYY-MM-DD'), 9.95813, 0.357524 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-07-02','YYYY-MM-DD'), 9.17437, 0.348752 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-07-09','YYYY-MM-DD'), 8.85688, 0.337124 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-07-16','YYYY-MM-DD'), 8.32125, 0.338705 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-07-23','YYYY-MM-DD'), 7.75125, 0.326994 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-07-30','YYYY-MM-DD'), 7.07937, 0.330131 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-08-06','YYYY-MM-DD'), 6.58063, 0.341845 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-08-13','YYYY-MM-DD'), 6.34875, 0.347871 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-08-20','YYYY-MM-DD'), 5.97437, 0.353078 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-08-27','YYYY-MM-DD'), 5.60063, 0.344274 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-09-03','YYYY-MM-DD'), 5.32312, 0.353826 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-09-10','YYYY-MM-DD'), 5.27437, 0.358863 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-09-17','YYYY-MM-DD'), 5.07625, 0.365825 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-09-24','YYYY-MM-DD'), 5.60063, 0.370408 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-10-01','YYYY-MM-DD'), 6.27313, 0.367674 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-10-08','YYYY-MM-DD'), 7.09688, 0.379841 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-10-15','YYYY-MM-DD'), 7.94875, 0.387439 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-10-22','YYYY-MM-DD'), 8.29, 0.415393 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-10-29','YYYY-MM-DD'), 9.15, 0.42704 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-11-05','YYYY-MM-DD'), 9.65, 0.438842 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-11-12','YYYY-MM-DD'), 10.0013, 0.459822 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-11-19','YYYY-MM-DD'), 10.3725, 0.460059 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-11-26','YYYY-MM-DD'), 11.0431, 0.462761 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-12-03','YYYY-MM-DD'), 11.955, 0.471848 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-12-10','YYYY-MM-DD'), 12.5806, 0.472638 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-12-17','YYYY-MM-DD'), 12.7812, 0.454118 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2010-12-24','YYYY-MM-DD'), 13.1581, 0.475504 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-01-01','YYYY-MM-DD'), 13.4019, 0.462367 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-01-08','YYYY-MM-DD'), 13.6819, 0.465325 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-01-15','YYYY-MM-DD'), 14.0737, 0.466733 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-01-22','YYYY-MM-DD'), 14.31, 0.461545 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-01-29','YYYY-MM-DD'), 14.6306, 0.47256 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-02-05','YYYY-MM-DD'), 14.7937, 0.478094 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-02-12','YYYY-MM-DD'), 15.0044, 0.474667 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-02-19','YYYY-MM-DD'), 15.1112, 0.473183 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-02-26','YYYY-MM-DD'), 15.13, 0.467513 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-03-05','YYYY-MM-DD'), 15.2525, 0.479868 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-03-12','YYYY-MM-DD'), 15.1594, 0.478556 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-03-19','YYYY-MM-DD'), 15.0413, 0.465612 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-03-26','YYYY-MM-DD'), 14.9575, 0.482023 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-04-02','YYYY-MM-DD'), 15.0013, 0.483321 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-04-09','YYYY-MM-DD'), 14.75, 0.480343 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-04-16','YYYY-MM-DD'), 14.5706, 0.481231 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-04-23','YYYY-MM-DD'), 14.315, 0.458644 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-04-30','YYYY-MM-DD'), 13.8862, 0.461854 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-05-07','YYYY-MM-DD'), 13.4906, 0.458018 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-05-14','YYYY-MM-DD'), 12.9888, 0.45048 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-05-21','YYYY-MM-DD'), 12.6775, 0.435742 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-05-28','YYYY-MM-DD'), 12.4062, 0.442708 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-06-04','YYYY-MM-DD'), 12.005, 0.444627 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-06-11','YYYY-MM-DD'), 11.3975, 0.422324 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-06-18','YYYY-MM-DD'), 10.705, 0.406756 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-06-25','YYYY-MM-DD'), 10.2225, 0.368139 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-07-02','YYYY-MM-DD'), 9.475, 0.353338 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-07-09','YYYY-MM-DD'), 8.59, 0.353287 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-07-16','YYYY-MM-DD'), 7.68937, 0.340418 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-07-23','YYYY-MM-DD'), 7.31938, 0.325891 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-07-30','YYYY-MM-DD'), 6.9825, 0.318303 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-08-06','YYYY-MM-DD'), 6.50187, 0.314836 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-08-13','YYYY-MM-DD'), 5.80625, 0.317549 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-08-20','YYYY-MM-DD'), 5.3875, 0.326545 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-08-27','YYYY-MM-DD'), 4.9925, 0.341487 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-09-03','YYYY-MM-DD'), 4.67188, 0.347205 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-09-10','YYYY-MM-DD'), 4.8025, 0.342336 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-09-17','YYYY-MM-DD'), 5.00187, 0.348555 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-09-24','YYYY-MM-DD'), 5.1375, 0.358991 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-10-01','YYYY-MM-DD'), 5.64125, 0.371509 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-10-08','YYYY-MM-DD'), 6.1875, 0.380129 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-10-15','YYYY-MM-DD'), 6.89062, 0.385149 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-10-22','YYYY-MM-DD'), 8.19938, 0.390918 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-10-29','YYYY-MM-DD'), 9.18188, 0.402999 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-11-05','YYYY-MM-DD'), 9.60312, 0.431452 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-11-12','YYYY-MM-DD'), 10.0369, 0.452412 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-11-19','YYYY-MM-DD'), 10.6506, 0.477577 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-11-26','YYYY-MM-DD'), 11.2781, 0.479517 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-12-03','YYYY-MM-DD'), 12.0281, 0.451901 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-12-10','YYYY-MM-DD'), 12.4744, 0.467757 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-12-17','YYYY-MM-DD'), 12.8825, 0.480382 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2011-12-24','YYYY-MM-DD'), 13.4288, 0.472929 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-01-01','YYYY-MM-DD'), 13.9362, 0.494839 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-01-08','YYYY-MM-DD'), 14.2712, 0.496038 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-01-15','YYYY-MM-DD'), 14.1969, 0.484767 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-01-22','YYYY-MM-DD'), 14.5969, 0.478941 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-01-29','YYYY-MM-DD'), 14.745, 0.478253 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-02-05','YYYY-MM-DD'), 14.9044, 0.462681 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-02-12','YYYY-MM-DD'), 15.2738, 0.478289 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-02-19','YYYY-MM-DD'), 15.3575, 0.480699 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-02-26','YYYY-MM-DD'), 15.8944, 0.48018 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-03-05','YYYY-MM-DD'), 15.975, 0.477586 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-03-12','YYYY-MM-DD'), 15.9438, 0.476981 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-03-19','YYYY-MM-DD'), 15.9181, 0.478544 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-03-26','YYYY-MM-DD'), 15.9081, 0.479444 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-04-02','YYYY-MM-DD'), 15.7375, 0.480936 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-04-09','YYYY-MM-DD'), 15.3681, 0.482475 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-04-16','YYYY-MM-DD'), 15.1856, 0.490005 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-04-23','YYYY-MM-DD'), 14.9906, 0.487218 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-04-30','YYYY-MM-DD'), 14.2156, 0.483494 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-05-07','YYYY-MM-DD'), 13.8425, 0.469866 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-05-14','YYYY-MM-DD'), 13.5, 0.449905 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-05-21','YYYY-MM-DD'), 13.1294, 0.437464 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-05-28','YYYY-MM-DD'), 12.8256, 0.426091 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-06-04','YYYY-MM-DD'), 12.3425, 0.434431 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-06-11','YYYY-MM-DD'), 11.4419, 0.394801 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-06-18','YYYY-MM-DD'), 10.9462, 0.37469 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-06-25','YYYY-MM-DD'), 10.2556, 0.356698 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-07-02','YYYY-MM-DD'), 9.22563, 0.348804 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-07-09','YYYY-MM-DD'), 8.46625, 0.335503 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-07-16','YYYY-MM-DD'), 7.91187, 0.324811 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-07-23','YYYY-MM-DD'), 7.42875, 0.328379 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-07-30','YYYY-MM-DD'), 6.78687, 0.31679 );
INSERT into TIMESERIES(seriesno, compbegindate, extent, roughness) VALUES (SEQ_TIMESERIES.nextval, to_date('2012-08-06','YYYY-MM-DD'), 6.04375, 0.319185 );
/**/


CREATE OR REPLACE
FUNCTION seq_nextval_on_demand (p_seq_name  IN  VARCHAR2)
  RETURN NUMBER
IS
  v_seq_val  NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'select ' || p_seq_name || '.nextval from dual'
     INTO v_seq_val;
  RETURN v_seq_val;
END seq_nextval_on_demand;
/

commit;

-- MERGE INTO TIMESERIES ae
-- USING (SELECT ? compbegindate, ? extent, ? roughness FROM dual) incoming
-- ON (ae.compbegindate = incoming.compbegindate)
-- WHEN MATCHED THEN
-- UPDATE SET ae.extent = incoming.extent, ae.roughness = incoming.roughness
-- WHEN NOT MATCHED THEN 
-- INSERT (ae.seriesno, ae.compbegindate, ae.extent, ae.roughness) 
-- VALUES (seq_nextval_on_demand('SEQ_TIMESERIES'), incoming.compbegindate, incoming.extent, incoming.roughness)

/**
 * final String upsertQuery = "MERGE INTO TIMESERIES ae " + //AlreadyExists
			"USING (SELECT ? compbegindate, ? extent, ? roughness FROM dual) incoming " +
			"ON (ae.compbegindate = incoming.compbegindate) " +
			"WHEN MATCHED THEN " +
			"UPDATE SET ae.extent = incoming.extent, ae.roughness = incoming.roughness " +
			"WHEN NOT MATCHED THEN " +
			"INSERT (ae.seriesno, ae.compbegindate, ae.extent, ae.roughness) " +
			"VALUES (seq_nextval_on_demand('SEQ_TIMESERIES'), incoming.compbegindate, incoming.extent, incoming.roughness)";
 * */

alter table attachefile modify(filetype varchar2(100)); 
alter table member modify userpw varchar2(200);
/** 
 * 350fd3fadb4fa4b97c12b1d42b00437618d4413e2248ac589926e894f866cfd6 == '해빙1357!'
 * */
update member set userpw='350fd3fadb4fa4b97c12b1d42b00437618d4413e2248ac589926e894f866cfd6' where userid='nmsc';
