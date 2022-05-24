CREATE TABLE FREEBOARD (
	IDX INTEGER,
	NAME VARCHAR2(20) NOT NULL,
	PASSWORD VARCHAR2(20) NOT NULL,
	SUBJECT VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(3000) NOT NULL,
	WRITEDATE TIMESTAMP DEFAULT sysdate,
	HIT INTEGER DEFAULT 0,
	NOTICE CHAR(3) DEFAULT 'no',
	IP CHAR(15),
	CONSTRAINT NEWTABLE_PK PRIMARY KEY (IDX)
);

DELETE FROM freeboard;
DROP SEQUENCE freeboard_idx_seq;
CREATE SEQUENCE freeboard_idx_seq;

SELECT * FROM FREEBOARD ORDER BY idx DESC;
SELECT count(*) FROM FREEBOARD;
select * from freeboard where notice = 'yes' order by idx DESC;

insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '홍길동', '1111', '1등', '1등 입니다.', '192.168.100.101');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '임꺽정', '2222', '2등', '2등 입니다.', '192.168.100.102');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '장길산', '3333', '3등', '3등 입니다.', '192.168.100.103');
insert into freeboard (idx, name, password, subject, content, ip) 
values (freeboard_idx_seq.nextval, '일지매', '4444', '4등', '4등 입니다.', '192.168.100.104');

==========================================================================================

CREATE TABLE FREEBOARDCOMMENT (
	IDX INTEGER,
	GUP INTEGER,
	NAME VARCHAR2(20) NOT NULL,
	PASSWORD VARCHAR2(20) NOT NULL,
	CONTENT VARCHAR2(400) NOT NULL,
	WRITEDATE TIMESTAMP DEFAULT sysdate,
	IP CHAR(15),
	CONSTRAINT FREEBOARDCOMMENT_PK PRIMARY KEY (IDX)
);

SELECT * FROM FREEBOARDCOMMENT;

DELETE FROM freeboardcomment;
DROP SEQUENCE freeboardcomment_idx_seq;
CREATE SEQUENCE freeboardcomment_idx_seq;

