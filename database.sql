
	------------------------------------------------------
	-- BAZY DANYCH
	--
	-- SQL
	--
	-- DB server: Oracle 10g
	--
	-- Script v. 1.1.2
	--
	-- Copyright (c)Szmyd Jan
	------------------------------------------------------
	--@"C:\oracle\Jan_Szmyd.sql"
	
	CLEAR SCREEN;
	set serveroutput on;
	alter session set nls_date_format='yyyy-mm-dd';
	set linesize 1000;
	set pagesize 1000;
	
	-------------------------------------------
	--------------KASOWANIE TABEL--------------
	-------------------------------------------
	
	drop table TURNIEJ_OFFLINE;
	drop table TURNIEJ_ONLINE;
	drop table LIGA;
	drop table ORGANIZATOR;
	drop table GRACZ;
	drop table DRUZYNA;
	drop table TRENER;
	drop table SPONSOR;
	
	-------------------------------------------
	-----------CREATE TABLE SPONSOR------------
	-------------------------------------------
	
	CREATE TABLE SPONSOR(
	SPOk_1_ID  						number(4) NOT NULL,
	SPO_NAZWA						varchar2(20) NOT NULL,
	SPO_PODMIOT_SPONSORINGU			varchar2(40)
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table SPONSOR
	add constraint PK_SPONSOR
	primary key (SPOk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_SPONSOR;
	--
	create sequence SEQ_SPONSOR increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_SPONSOR
	before insert on SPONSOR
	for each row
	begin
	if :new.SPOk_1_ID is NULL then
	SELECT SEQ_SPONSOR.nextval INTO :new.SPOk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------
	
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('Kinguin','devils.one');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('Fortuna','AGO Esports');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('LG','Virtus Pro');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('Intel','Intel Extreme Masters: Katowice 2019');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('HyperX','PGL Major: Krakow 2017');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('Dell','ELEAGUE Major: Atlanta 2017');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('Mountain Dew','ESEA MDL Season 30 Europe');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('LOOT.BET','LOOT.BET Season 1');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('OMEN by HP','BLAST Pro Series Sao Paulo 2019');
	INSERT INTO SPONSOR(SPO_NAZWA,SPO_PODMIOT_SPONSORINGU) 
	VALUES ('OMEN by HP','Astralis');
	
	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_SPO_NAZWA
	ON SPONSOR (UPPER (SPO_NAZWA))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_SPO_PODMIOT_SPONSORINGU
	ON SPONSOR (UPPER (SPO_PODMIOT_SPONSORINGU))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;

	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	column SPOk_1_ID				HEADING 'ID'						format 999;
	column SPO_NAZWA				HEADING 'Nazwa'						format A20;
	column SPO_PODMIOT_SPONSORINGU	HEADING 'Podmiot sponsoringu'		format A40;
	SELECT * FROM SPONSOR;
	
	/*
	ID   Nazwa sponsora  Podmiot sponsoringu      
	---  --------------  ------------------------------------
	1	 Kinguin         devils.one
	2	 Fortuna         AGO Esports
	3	 LG              Virtus Pro
	4	 Intel           Intel Extreme Masters: Katowice 2019
	5	 HyperX          PGL Major: Krakow 2017
	6	 Dell            ELEAGUE Major: Atlanta 2017
	7	 Mountain Dew    ESEA MDL Season 30 Europe
	8	 LOOT.BET        LOOT.BET Season 1
	9	 OMEN by HP      BLAST Pro Series Sao Paulo 2019
	*/
	
	-------------------------------------------
	------------CREATE TABLE TRENER------------
	-------------------------------------------
	
	CREATE TABLE TRENER(
	TREk_1_ID  			number(4) NOT NULL,
	TRE_IMIE			varchar2(10) NOT NULL,
	TRE_NAZWISKO		varchar2(10) NOT NULL,
	TRE_NICKNAME 	    varchar2(10),
	TRE_OSIAGNIECIA		varchar2(160),
	TRE_NARODOWOSC 		varchar2(15),
	TRE_WIEK 			number(4) 
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table TRENER
	add constraint PK_TRENER
	primary key (TREk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_TRENER;
	--
	create sequence SEQ_TRENER increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_TRENER
	before insert on TRENER
	for each row
	begin
	if :new.TREk_1_ID is NULL then
	SELECT SEQ_TRENER.nextval INTO :new.TREk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------

	INSERT INTO TRENER(TRE_IMIE,TRE_NAZWISKO,TRE_NICKNAME,TRE_NARODOWOSC,TRE_WIEK,TRE_OSIAGNIECIA) 
	VALUES ('Mariusz','Cybulski','Loord','Polska','17','1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016');
	INSERT INTO TRENER(TRE_IMIE,TRE_NAZWISKO,TRE_NICKNAME,TRE_NARODOWOSC,TRE_WIEK,TRE_OSIAGNIECIA) 
	VALUES ('Mikolaj','Michalkow','miNirox','Polska','21','2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018');
	INSERT INTO TRENER(TRE_IMIE,TRE_NAZWISKO,TRE_NICKNAME,TRE_NARODOWOSC,TRE_WIEK,TRE_OSIAGNIECIA) 
	VALUES ('Jakub','Garczynski','kuben','Polska','30','2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1');
	INSERT INTO TRENER(TRE_IMIE,TRE_NAZWISKO,TRE_NICKNAME,TRE_NARODOWOSC,TRE_WIEK,TRE_OSIAGNIECIA) 
	VALUES ('Danny','Sorensen','zonic','Denmark','32','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018');
	
	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_TRE_IMIE
	ON TRENER (UPPER (TRE_IMIE))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_TRE_NAZWISKO
	ON TRENER (UPPER (TRE_NAZWISKO))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_TRE_NARODOWOSC
	ON TRENER (UPPER (TRE_NARODOWOSC))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	column TREk_1_ID			HEADING 'ID'							format 999;
	column TRE_IMIE				HEADING 'Imie'							format A20;
	column TRE_NAZWISKO			HEADING 'Nazwisko'						format A20;
	column TRE_NICKNAME			HEADING 'Nickname'						format A20;
	column TRE_NARODOWOSC		HEADING 'Narodowosc'					format A20;
	column TRE_WIEK				HEADING 'Wiek'							format 99;
	column TRE_OSIAGNIECIA		HEADING 'Osiagniecia'					format A160;
	SELECT * FROM TRENER;
	

	/*
	ID   Imie  	 Nazwisko    Nickname	  Narodowosc  Wiek  Osiagniecia 
	---  -------  ----------  -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------
	1	 Mariusz  Cybulski    Loord        Polska      17    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016         
	2	 Mikolaj  Michalkow   miNirox      Polska      21    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018          
	3	 Jakub    Garczynski  kuben        Polska      30    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          
	4    Danny    Sorensen    zonic        Denmark     32    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018
	*/
	
	-------------------------------------------
	------------CREATE TABLE DRUZYNA-----------
	-------------------------------------------
	
	CREATE TABLE DRUZYNA(
	DRUk_1_ID  			number(4) NOT NULL,
	DRU_NAZWA			varchar2(13) NOT NULL,
	DRU_LOGO			varchar2(10),
	DRU_ORGANIZACJA 	varchar2(30),
	DRU_OSIAGNIECIA		varchar2(150),
	DRU_REZERWOWY		varchar2(10),
	TRE_ID  			number(4),
	SPO_ID  			number(4)
	);
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table DRUZYNA add constraint PK_DRUZYNA
	primary key (DRUk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table DRUZYNA add constraint FK_DRUZYNA
	foreign key (TRE_ID)
	references TRENER (TREk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table DRUZYNA add constraint FK_DRUZYNA2
	foreign key (SPO_ID)
	references SPONSOR (SPOk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_DRUZYNA;
	--
	create sequence SEQ_DRUZYNA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_DRUZYNA
	before insert on DRUZYNA
	for each row
	begin
	if :new.DRUk_1_ID is NULL then
	SELECT SEQ_DRUZYNA.nextval INTO :new.DRUk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------

	INSERT INTO DRUZYNA(DRU_NAZWA,DRU_LOGO,DRU_ORGANIZACJA,DRU_OSIAGNIECIA,DRU_REZERWOWY,TRE_ID,SPO_ID) 
	VALUES ('devils.one','-', 'devils.one', '1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016','reatz',1,1);
	INSERT INTO DRUZYNA(DRU_NAZWA,DRU_LOGO,DRU_ORGANIZACJA,DRU_OSIAGNIECIA,DRU_REZERWOWY,TRE_ID,SPO_ID) 
	VALUES ('AGO Esports','-', 'AGO Esports', '2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018','TOAO',2,2);
	INSERT INTO DRUZYNA(DRU_NAZWA,DRU_LOGO,DRU_ORGANIZACJA,DRU_OSIAGNIECIA,DRU_REZERWOWY,TRE_ID,SPO_ID) 
	VALUES ('Virtus Pro','-', 'Virtus Pro', '2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1','morelz',3,3);
    INSERT INTO DRUZYNA(DRU_NAZWA,DRU_LOGO,DRU_ORGANIZACJA,DRU_OSIAGNIECIA,DRU_REZERWOWY,TRE_ID,SPO_ID) 
	VALUES ('Astralis','-', 'Astralis', '1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018','Kjaerbye',4,10);
	
	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_DRU_NAZWA
	ON DRUZYNA (UPPER (DRU_NAZWA))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_DRU_ORGANIZACJA
	ON DRUZYNA (UPPER (DRU_ORGANIZACJA))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------

	column DRUk_1_ID				HEADING 'ID'					format 999;
	column DRU_NAZWA				HEADING 'Nazwa'					format A20;
	column DRU_LOGO					HEADING 'Logo'					format A30;
	column DRU_ORGANIZACJA			HEADING 'Nazwa organizacji'		format A30;
	column DRU_OSIAGNIECIA			HEADING 'Osiagniecia'			format A30;
	column DRU_REZERWOWY			HEADING 'Rezerwowy'				format A20;
	column TRE_ID					HEADING 'ID trenera'			format 999;
	column SPO_ID					HEADING 'ID sponsora'			format 999;
	SELECT * FROM DRUZYNA;

	/*
	ID   Nazwa        Logo  Organizacja  Osiagniecia       																										     Rezerwowy  ID trenera  ID sponsora
	---  -----------  ----  -----------  --------------------------------------------------------------------------------------------------------------------------  ---------  ----------  -----------
	1    devils.one         devils.one   1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016      					 reatz      1           1
	2	 AGO Esports        AGO Esports  2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  TOAO       2           2
	3    Virtus Pro         Virtus Pro   2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1												 morelz     3           3
	4    Astralis           Astralis     1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   Kjaerbye   4           10
	*/
	
	--------------------------------------------
	-------------CREATE TABLE GRACZ-------------
	--------------------------------------------
	
	CREATE TABLE 
	GRACZ(
	GRAk_1_ID  			number(4) NOT NULL,
	GRA_IMIE 			varchar2(10) NOT NULL,
	GRA_NAZWISKO 		varchar2(15) NOT NULL,
	GRA_NICKNAME 		varchar2(12) NOT NULL,
	GRA_NARODOWOSC 		varchar2(20),
	GRA_WIEK 			number(4),
	GRA_OSIAGNIECIA 	varchar2(150),
    DRU_ID              number(4)
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table GRACZ
	add constraint PK_GRACZ
	primary key (GRAk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table GRACZ add constraint FK_GRACZ
	foreign key (DRU_ID)
	references DRUZYNA (DRUk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_GRACZ;
	--
	create sequence SEQ_GRACZ increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_GRACZ
	before insert on GRACZ
	for each row
	begin
	if :new.GRAk_1_ID is NULL then
	SELECT SEQ_GRACZ.nextval INTO :new.GRAk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	----------------INSERT------------------
	----------------------------------------

	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Karol','Rodowicz','rallen','Poland','24','1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016',1);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Grzegorz','Dziamalek','Szpero','Poland','27','2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018',2);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Janusz','Pogorzelski','Sn','Poland','25','2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1',3);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Nicolai','Reedtz','dev1ce','Denmark','23','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018',4);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Peter','Rasmusseni','dupreeh','Denmark','26','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018',4);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Andreas','Hojsleth','Xyp9x','Denmark','23','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018',4);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Lukas','Rossander','gla1ve','Denmark','23','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018',4);
	INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME,GRA_NARODOWOSC,GRA_WIEK,GRA_OSIAGNIECIA,DRU_ID) 
	VALUES ('Emil','Reif','Magisk','Denmark','21','1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018',4);

	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_GRA_IMIE
	ON GRACZ (UPPER (GRA_IMIE))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_GRA_NAZWISKO
	ON GRACZ (UPPER (GRA_NAZWISKO))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_GRA_NARODOWOSC
	ON GRACZ (UPPER (GRA_NARODOWOSC))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------

	column GRAk_1_ID			HEADING 'ID'							format 999;
	column GRA_IMIE				HEADING 'Imie'							format A20;
	column GRA_NAZWISKO			HEADING 'Nazwisko'						format A20;
	column GRA_NICKNAME			HEADING 'Nickname'						format A20;
	column GRA_NARODOWOSC		HEADING 'Narodowosc'					format A20;
	column GRA_WIEK				HEADING 'Wiek'							format 999;
	column GRA_OSIAGNIECIA		HEADING 'Osiagniecia'					format A140;
	column DRU_ID				HEADING 'ID Druzyny'					format 999;
	SELECT * FROM GRACZ;

	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1	 Karol     Rodowicz     rallen       Polska      24    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016                        1
	2	 Grzegorz  Dziamalek    Szpero       Polska      27    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  2      
	3	 Janusz    Pogorzelski  Sn           Polska      25    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          									   3
	4	 Nicolai   Reedtz       dev1ce       Polska      25    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	  
	5	 Peter     Rasmusseni   dupreeh      Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4
	6	 Andreas   Hojsleth     Xyp9x        Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	7	 Lukas     Rossander    gla1ve       Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	8	 Emil      Reif         Magisk       Polska      21    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4 
	*/
	
	SELECT *
	FROM GRACZ JOIN DRUZYNA ON DRUZYNA.DRUk_1_ID = GRACZ.DRU_ID;
	
	-------------------------------------------	
	----------CREATE TABLE ORGANIZATOR---------
	-------------------------------------------
	
	CREATE TABLE ORGANIZATOR(
	ORGk_1_ID  							number(4) NOT NULL,
	ORG_NAZWA							varchar2(30) NOT NULL,
	ORG_PODMIOT_ORGANIZOWANY			varchar2(40),
	SPO_ID  							number(4)
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table ORGANIZATOR
	add constraint PK_ORGANIZATOR
	primary key (ORGk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table ORGANIZATOR add constraint FK_ORGANIZATOR
	foreign key (SPO_ID)
	references SPONSOR (SPOk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_ORGANIZATOR;
	--
	create sequence SEQ_ORGANIZATOR increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_ORGANIZATOR
	before insert on ORGANIZATOR
	for each row
	begin
	if :new.ORGk_1_ID is NULL then
	SELECT SEQ_ORGANIZATOR.nextval INTO :new.ORGk_1_ID FROM dual;
	end if;
	end;
/
	
	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------
	
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('ESL','Intel Extreme Masters: Katowice 2019',4);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('PGL','PGL Major: Kraków 2017',5);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('ELEAGUE','ELEAGUE Major: Atlanta 2017',6);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('ESEA','ESEA MDL Season 30 Europe',7);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('UCC','LOOT.BET Season 1',8);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('FACEIT','ECS Season 7 Europe Week 2',5);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('RFRSH','BLAST Pro Series Sao Paulo 2019',9);
	INSERT INTO ORGANIZATOR(ORG_NAZWA,ORG_PODMIOT_ORGANIZOWANY,SPO_ID) 
	VALUES ('Alisports','WESG 2018 World Finals',5);
	
	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_ORG_NAZWA
	ON ORGANIZATOR (UPPER (ORG_NAZWA))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	CREATE INDEX IX_ORG_PODMIOT_ORGANIZOWANY
	ON ORGANIZATOR (UPPER (ORG_PODMIOT_ORGANIZOWANY))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	column ORGk_1_ID						HEADING 'ID'							format 999;
	column ORG_NAZWA						HEADING 'Organizator'					format A30;
	column ORG_PODMIOT_ORGANIZOWANY			HEADING 'Podmiot organizowany'			format A40;
	column SPO_ID							HEADING 'ID sponsora'					format 999;
	SELECT * FROM ORGANIZATOR;

	/*
	ID   Nazwa organizatora  Podmiot organizowany                  ID Sponsora
	---  ------------------  ------------------------------------  -----------
	1    ESL             	 Intel Extreme Masters: Katowice 2019  4
	2	 PGL         		 PGL Major: Kraków 2017            	   5
	3	 ELEAGUE             ELEAGUE Major: Atlanta 2017		   6
	4	 ESEA           	 ESEA MDL Season 30 Europe             7
	5	 UCC          		 LOOT.BET Season 1                     8
	6	 FACEIT              ECS Season 7 Europe Week 2            5
	7	 RFRSH        		 BLAST Pro Series Sao Paulo 2019       9
	8	 Alisports           WESG 2018 World Finals                5
	*/
	
	-------------------------------------------
	-------------CREATE TABLE LIGA-------------
	-------------------------------------------
	
	CREATE TABLE LIGA(
	LIGk_1_ID  						number(4) NOT NULL,
	LIG_NAZWA_LIGI					varchar2(35) NOT NULL,
	LIG_ZWYCIEZCA					varchar2(20) NOT NULL,
	LIG_PULA_NAGROD			    	number(10) NOT NULL,
	LIG_DATA_ROZGRYWEK			  	date NOT NULL,
	ORG_ID  						number(4) NOT NULL,
	SPO_ID  						number(4) NOT NULL
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table LIGA
	add constraint PK_LIGA
	primary key (LIGk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table LIGA add constraint FK_LIGA
	foreign key (SPO_ID)
	references SPONSOR (SPOk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table LIGA add constraint FK_LIGA2
	foreign key (ORG_ID)
	references ORGANIZATOR (ORGk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_LIGA;
	--
	create sequence SEQ_LIGA increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_LIGA
	before insert on LIGA
	for each row
	begin
	if :new.LIGk_1_ID is NULL then
	SELECT SEQ_LIGA.nextval INTO :new.LIGk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------
	
	INSERT INTO LIGA(LIG_NAZWA_LIGI,LIG_ZWYCIEZCA,LIG_PULA_NAGROD,LIG_DATA_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('ESL Pro League Season 8 Europe','Astralis', 105000, '2018-10-02',4,1);
	INSERT INTO LIGA(LIG_NAZWA_LIGI,LIG_ZWYCIEZCA,LIG_PULA_NAGROD,LIG_DATA_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('ESEA MDL Season 30 Europe','3DMAX', 35000, '2018-09-18',7,2);
	
	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_LIG_NAZWA_LIGI
	ON LIGA (UPPER (LIG_NAZWA_LIGI))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	create index IX_LIG_PULA_NAGROD 
	on LIGA (LIG_PULA_NAGROD)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;	
	
	create index IX_LIG_DATA_ROZGRYWEK 
	on LIGA (LIG_DATA_ROZGRYWEK)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;

	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	column LIGk_1_ID					HEADING 'ID'					format 999;
	column LIG_NAZWA_LIGI				HEADING 'Nazwa'					format A35;
	column LIG_ZWYCIEZCA				HEADING 'Zwyciezca'				format A20;
	column LIG_PULA_NAGROD				HEADING 'Pula nagrod'			format 9999999;
	column LIG_DATA_ROZGRYWEK			HEADING 'Data rozgrywek'		format A11;
	column ORG_ID						HEADING 'ID organizatora'		format 999;
	column SPO_ID						HEADING 'ID sponsora'			format 999;
	SELECT * FROM LIGA;
	
	/*
	ID   Nazwa Ligi                      Zwyciezca  Pula nagrod  Data rozgrywek  ID sponsora  ID organizatora
	---  ------------------------------  ---------  -----------  --------------  -----------  ---------------
	1    ESL Pro League Season 8 Europe  Astralis   105000       2018-10-02      4            1
	2	 ESEA MDL Season 30 Europe       3DMAX		35000        2018-09-18      7            2
	*/
	
	-------------------------------------------
	--------CREATE TABLE TURNIEJ_ONLINE--------
	-------------------------------------------
	
	CREATE TABLE TURNIEJ_ONLINE(
	TURONk_1_ID  						number(4) NOT NULL,
	TURON_NAZWA_TURNIEJU				varchar2(30) NOT NULL,
	TURON_ZWYCIEZCA						varchar2(20) NOT NULL,
	TURON_PULA_NAGROD			    	number(10) NOT NULL,
	TURON_DATA_ROZGRYWEK			    date NOT NULL,
	ORG_ID  							number(4) NOT NULL,
	SPO_ID  							number(4) NOT NULL
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_ONLINE
	add constraint PK_TURNIEJ_ONLINE
	primary key (TURONk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_ONLINE add constraint FK_TURNIEJ_ONLINE
	foreign key (SPO_ID)
	references SPONSOR (SPOk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_ONLINE add constraint FK_TURNIEJ_ONLINE2
	foreign key (ORG_ID)
	references ORGANIZATOR (ORGk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_TURNIEJ_ONLINE;
	--
	create sequence SEQ_TURNIEJ_ONLINE increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_TURNIEJ_ONLINE
	before insert on TURNIEJ_ONLINE
	for each row
	begin
	if :new.TURONk_1_ID is NULL then
	SELECT SEQ_TURNIEJ_ONLINE.nextval INTO :new.TURONk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------

	INSERT INTO TURNIEJ_ONLINE(TURON_NAZWA_TURNIEJU,TURON_ZWYCIEZCA,TURON_PULA_NAGROD,TURON_DATA_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('LOOT.BET Season 1','AVANGAR', 30000, '2019-02-04',8,5);
	INSERT INTO TURNIEJ_ONLINE(TURON_NAZWA_TURNIEJU,TURON_ZWYCIEZCA,TURON_PULA_NAGROD,TURON_DATA_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('ECS Season 7 Europe Week 2','North', 25000, '2019-03-18',5,6);

	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_TURON_NAZWA_TURNIEJU
	ON TURNIEJ_ONLINE (UPPER (TURON_NAZWA_TURNIEJU))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	create index IX_TURON_PULA_NAGROD 
	on TURNIEJ_ONLINE (TURON_PULA_NAGROD)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;	
	
	create index IX_TURON_DATA_ROZGRYWEK 
	on TURNIEJ_ONLINE (TURON_DATA_ROZGRYWEK)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;	
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------

	column TURONk_1_ID					HEADING 'ID'					format 999;
	column TURON_NAZWA_TURNIEJU			HEADING 'Nazwa'					format A30;
	column TURON_ZWYCIEZCA				HEADING 'Zwyciezca'				format A20;
	column TURON_PULA_NAGROD			HEADING 'Pula nagrod'			format 9999999999;
	column TURON_DATA_ROZGRYWEK			HEADING 'Data rozgrywek'		format A11;
	column ORG_ID						HEADING 'ID organizatora'		format 999;
	column SPO_ID						HEADING 'ID sponsora'			format 999;
	SELECT * FROM TURNIEJ_ONLINE;

	/*
	ID   Nazwa turnieju              Zwyciezca  Pula nagrod  Data rozgrywek  ID sponsora  ID organizatora
	---  --------------------------  ---------  -----------  --------------  -----------  --------------- 
	1    LOOT.BET Season 1           AVANGAR    30000        2019-02-04      8            5
	2	 ECS Season 7 Europe Week 2  North		25000        2019-03-18      5            6
	*/
	
	-------------------------------------------
	-------CREATE TABLE TURNIEJ_OFFLINE--------
	-------------------------------------------
	
	CREATE TABLE TURNIEJ_OFFLINE(
	TUROFk_1_ID  						number(4) NOT NULL,
	TUROF_NAZWA_TURNIEJU				varchar2(40) NOT NULL,
	TUROF_ZWYCIEZCA						varchar2(20) NOT NULL,
	TUROF_PULA_NAGROD			    	number(20) NOT NULL,
	TUROF_DATA_ROZGRYWEK			    date NOT NULL,
	TUROF_MIEJSCE_ROZGRYWEK			    varchar2(20) NOT NULL,
	ORG_ID  							number(4),
	SPO_ID  							number(4) 
	);
	
	-------------------------------------------
	----------------PRIMARY KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_OFFLINE
	add constraint PK_TURNIEJ_OFFLINE
	primary key (TUROFk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_OFFLINE add constraint FK_TURNIEJ_OFFLINE
	foreign key (SPO_ID)
	references SPONSOR (SPOk_1_ID);
	
	-------------------------------------------
	----------------FOREIGN KEY----------------
	-------------------------------------------
	
	alter table TURNIEJ_OFFLINE add constraint FK_TURNIEJ_OFFLINE2
	foreign key (ORG_ID)
	references ORGANIZATOR (ORGk_1_ID);
	
	-------------------------------------------
	-----------------SEQUENCE------------------
	-------------------------------------------
	
	drop sequence SEQ_TURNIEJ_OFFLINE;
	--
	create sequence SEQ_TURNIEJ_OFFLINE increment by 1 start with 1
	maxvalue 9999999999 minvalue 1;
	
	-------------------------------------------
	-----------------TRIGGER-------------------
	-------------------------------------------
	
	create or replace trigger T_BI_TURNIEJ_OFFLINE
	before insert on TURNIEJ_OFFLINE
	for each row
	begin
	if :new.TUROFk_1_ID is NULL then
	SELECT SEQ_TURNIEJ_OFFLINE.nextval INTO :new.TUROFk_1_ID FROM dual;
	end if;
	end;
/

	----------------------------------------
	-----------------INSERT-----------------
	----------------------------------------
	
	INSERT INTO TURNIEJ_OFFLINE(TUROF_NAZWA_TURNIEJU,TUROF_ZWYCIEZCA,TUROF_PULA_NAGROD,TUROF_DATA_ROZGRYWEK,TUROF_MIEJSCE_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('IEM Katowice 2019','Astralis', 1000000, '2019-02-20','Katowice,Poland',4,1);
	INSERT INTO TURNIEJ_OFFLINE(TUROF_NAZWA_TURNIEJU,TUROF_ZWYCIEZCA,TUROF_PULA_NAGROD,TUROF_DATA_ROZGRYWEK,TUROF_MIEJSCE_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('BLAST Pro Series Sao Paulo 2019','Astralis', 250000, '2019-03-22','Sao Paulo,Brazil',9,7);	
	INSERT INTO TURNIEJ_OFFLINE(TUROF_NAZWA_TURNIEJU,TUROF_ZWYCIEZCA,TUROF_PULA_NAGROD,TUROF_DATA_ROZGRYWEK,TUROF_MIEJSCE_ROZGRYWEK,SPO_ID,ORG_ID) 
	VALUES ('WESG 2018 World Finals','Windigo', 890000, '2019-03-11','Chongqing,China',5,8);

	----------------------------------------;
	-- INDEX;
	----------------------------------------;
	
	CREATE INDEX IX_TUROF_NAZWA_TURNIEJU
	ON TURNIEJ_OFFLINE (UPPER (TUROF_NAZWA_TURNIEJU))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	create index IX_TUROF_PULA_NAGROD 
	on TURNIEJ_OFFLINE (TUROF_PULA_NAGROD)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;	
	
	create index IX_TUROF_DATA_ROZGRYWEK 
	on TURNIEJ_OFFLINE (TUROF_DATA_ROZGRYWEK)  
	STORAGE (INITIAL 10k NEXT 10k) 
	tablespace STUDENT_INDEX;	
	
	CREATE INDEX IX_TUROF_MIEJSCE_ROZGRYWEK
	ON TURNIEJ_OFFLINE (UPPER (TUROF_MIEJSCE_ROZGRYWEK))
	STORAGE (INITIAL 10k NEXT 10k)
	TABLESPACE STUDENT_INDEX;
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------

	column TUROFk_1_ID					HEADING 'ID'					format 999;
	column TUROF_NAZWA_TURNIEJU			HEADING 'Nazwa'					format A20;
	column TUROF_ZWYCIEZCA				HEADING 'Zwyciezca'				format A20;
	column TUROF_PULA_NAGROD			HEADING 'Pula nagrod'			format 9999999;
	column TUROF_DATA_ROZGRYWEK			HEADING 'Data rozgrywek'		format A20;
	column TUROF_MIEJSCE_ROZGRYWEK		HEADING 'Miejsce rozgrywek'		format A20;
	column ORG_ID						HEADING 'ID organizatora'		format 999;
	column SPO_ID						HEADING 'ID sponsora'			format 999;
	SELECT * FROM TURNIEJ_OFFLINE;
	
	/*
	ID   Nazwa turnieju                   Zwyciezca  Pula nagrod  Data rozgrywek  Miejsce rozgrywek  ID sponsora  ID organizatora
	---  -------------------------------  ---------  -----------  --------------  -----------------	 -----------  --------------- 
	1    IEM Katowice 2019                Astralis   1000000      2019-02-20      Katowice,Poland	 4            1
	2	 BLAST Pro Series Sao Paulo 2019  Astralis   250000       2019-03-22      Sao Paulo,Brazil	 9            7
	3    WESG 2018 World Finals           Windigo    890000       2019-03-11      Chongqing,China	 5            8
	*/

	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------

	SELECT 	f.GRA_IMIE,
			f.GRA_NAZWISKO,
			r.DRU_NAZWA
	FROM GRACZ f, DRUZYNA r
	WHERE f.GRAk_1_ID = r.DRUk_1_ID;
	
	/*
    Imie      Nazwisko     Nazwa druzyny
	--------  -----------  ------------
	Karol     Rodowicz     devils.one
	Grzegorz  Dziamalek    GO Esport
	Janusz    Pogorzelski  Virtus Pro
	*/

	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	SELECT 	e.TRE_IMIE,
			e.TRE_NAZWISKO,
			e.TRE_NICKNAME,
			t.DRU_NAZWA
	FROM TRENER e, DRUZYNA t
	WHERE e.TREk_1_ID = t.DRUk_1_ID;
	
	/*
	Imie     Nazwisko    Nickname  Nazwa druzyny
	-------  ----------  --------  -------------
	Mariusz  Cybulski    Loord     devils.one
	Mikolaj  Michalkow   miNirox   AGO Esport
	Jakub    Garczynski  kuben     Virtus Pro
	*/
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	SELECT 	g.LIG_NAZWA_LIGI,
			g.LIG_ZWYCIEZCA,
			y.SPO_NAZWA
	FROM LIGA g, SPONSOR y
	WHERE g.LIGk_1_ID = y.SPOk_1_ID;
	
	/*
	Nazwa                      Region    NAZWA
	-------------------------  --------  -------
	ESL Pro League 8 Europe    Astralis  Kinguin
	ESEA MDL Season 30 Europe  3DMAX     Fortuna
	*/
	
	----------------------------------------
	-----------------SELECT-----------------
	----------------------------------------
	
	SELECT TUROF_ZWYCIEZCA, AVG(TUROF_PULA_NAGROD) TUROF_PULA_NAGROD
	FROM TURNIEJ_OFFLINE
	HAVING AVG(TUROF_PULA_NAGROD)>1000
	group by TUROF_ZWYCIEZCA;
	
	/*
	Zwyciezca  Pula nagrod
	---------  -----------
	Astralis   625000
	Windigo    890000
	*/
	

	SELECT TURON_NAZWA_TURNIEJU, SUM(TURON_PULA_NAGROD) TURON_PULA_NAGROD
	FROM TURNIEJ_ONLINE
	HAVING TURON_NAZWA_TURNIEJU!='LOOT.BET Season 1'
	group by TURON_NAZWA_TURNIEJU;
	
	/*
	Nazwa                       Pula nagrod
	--------------------------  -----------
	ECS Season 7 Europe Week 2  25000
	*/
	
	
	SELECT LIG_NAZWA_LIGI, SUM(LIG_PULA_NAGROD) LIG_PULA_NAGROD
	FROM LIGA
	HAVING LIG_NAZWA_LIGI!='ESL Pro League Season 8 Europe'
	group by LIG_NAZWA_LIGI;
	
	/*
	Nazwa                 Pula nagrod
	--------------------  -----------
	ESEA MDL Season 30 E  35000
	*/
	
		SELECT GRA_IMIE, GRA_NAZWISKO, GRA_NICKNAME, DRU_NAZWA
	FROM GRACZ JOIN DRUZYNA ON DRUZYNA.DRUk_1_ID = GRACZ.DRU_ID;
	
	-----------------------------------------
	---------------Perspektywy---------------
	-----------------------------------------
	
	CREATE OR REPLACE VIEW 
	V_GRA_DRU_TRE
	(Imie_gracza, Nazwisko_gracza, Nickname_gracza, ID_druzyny, Nazwa_druzyny, Rezerwowy_druzyny, Imie_trenera, Nazwisko_trenera)
	AS 
	SELECT v.GRA_IMIE, v.GRA_NAZWISKO, v.GRA_NICKNAME, v.DRU_ID, v.DRU_NAZWA, v.DRU_REZERWOWY, v.TRE_IMIE, v.TRE_NAZWISKO
	FROM (
		SELECT *
		FROM GRACZ a, DRUZYNA b, TRENER c
		WHERE b.TRE_ID = c.TREk_1_ID AND a.DRU_ID = b.DRUk_1_ID 
		)v;
		
		create or replace trigger T_V_GRA_DRU_TRE
		INSTEAD OF INSERT ON V_GRA_DRU_TRE
		begin
		INSERT INTO GRACZ			VALUES (NULL, :new.Imie_gracza, :new.Nazwisko_gracza, :new.Nickname_gracza, NULL, NULL, NULL, :new.ID_druzyny);
		INSERT INTO DRUZYNA			VALUES (NULL, :new.Nazwa_druzyny, NULL, NULL, NULL, :new.Rezerwowy_druzyny, NULL, NULL);
		INSERT INTO TRENER			VALUES (NULL, :new.Imie_trenera, :new.Nazwisko_trenera, NULL, NULL, NULL, NULL);
		end;
		/
		SELECT *
	FROM V_GRA_DRU_TRE
		
	/*
	Imie gracza  Nazwisko gracza  Nickname  ID druzyny  Druzyna      Rezerwowy  Imie trenera  Nazwisko trenera
	-----------  ---------------  --------  ----------  -----------  ---------  ------------  ----------------
	Karol        Rodowicz    	  rallen    1			devils.one   reatz      Mariusz       Cybulski
	Grzegorz  	 Dziamalek   	  Szpero    2			Ago Esports  TOAO       Mikolaj       Michalkow 
	Janusz   	 Pogorzelski  	  Snax      3			Virtus Pro   morelz     Jakub	      Garczynski
	Nicolai      Reedtz           dev1ce    4			Astralis     Kjaerbye   Danny         Sorensen
	Peter        Rasmusseni       dupreeh   4			Astralis     Kjaerbye   Danny         Sorensen
	Andreas      Hojsleth         Xyp9x     4			Astralis     Kjaerbye   Danny         Sorensen
	Lukas        Rossander        gla1ve    4			Astralis     Kjaerbye   Danny         Sorensen
	Emil         Reif             Magisk    4			Astralis     Kjaerbye   Danny         Sorensen
	*/
		
	INSERT INTO V_GRA_DRU_TRE VALUES ('Wiktor','Wojtas','Taz',1,'devils.one','reatz','Mariusz','Cybulski');
	SELECT * FROM V_GRA_DRU_TRE;
	
	/*
	Imie gracza  Nazwisko gracza  Nickname  Druzyna      Rezerwowy  Imie trenera  Nazwisko trenera
	-----------  ---------------  --------  -----------  ---------  ------------  ----------------
	Karol        Rodowicz    	  rallen    devils.one   reatz      Mariusz       Cybulski
	Grzegorz  	 Dziamalek   	  Szpero    Ago Esports  TOAO       Mikolaj       Michalkow 
	Janusz   	 Pogorzelski  	  Snax      Virtus Pro   morelz     Jakub	      Garczynski
	Wiktor       Wojtas           Taz       devils.one   reatz      Mariusz       Cybulski
	Nicolai      Reedtz           dev1ce    Astralis     Kjaerbye   Danny         Sorensen
	Peter        Rasmusseni       dupreeh   Astralis     Kjaerbye   Danny         Sorensen
	Andreas      Hojsleth         Xyp9x     Astralis     Kjaerbye   Danny         Sorensen
	Lukas        Rossander        gla1ve    Astralis     Kjaerbye   Danny         Sorensen
	Emil         Reif             Magisk    Astralis     Kjaerbye   Danny         Sorensen
	*/

	DELETE V_GRA_DRU_TRE WHERE Nazwa_druzyny = 'AGO Esports';
	SELECT * FROM V_GRA_DRU_TRE;
	
	/*
	Imie gracza  Nazwisko gracza  Nickname  Druzyna      Rezerwowy  Imie trenera  Nazwisko trenera
	-----------  ---------------  --------  -----------  ---------  ------------  ----------------
	Karol        Rodowicz    	  rallen    devils.one   reatz      Mariusz       Cybulski
	Janusz   	 Pogorzelski  	  Snax      Virtus Pro   morelz     Jakub	      Garczynski
	Wiktor       Wojtas           Taz       devils.one   reatz      Mariusz       Cybulski
	Nicolai      Reedtz           dev1ce    Astralis     Kjaerbye   Danny         Sorensen
	Peter        Rasmusseni       dupreeh   Astralis     Kjaerbye   Danny         Sorensen
	Andreas      Hojsleth         Xyp9x     Astralis     Kjaerbye   Danny         Sorensen
	Lukas        Rossander        gla1ve    Astralis     Kjaerbye   Danny         Sorensen
	Emil         Reif             Magisk    Astralis     Kjaerbye   Danny         Sorensen
	*/

	UPDATE V_GRA_DRU_TRE SET Imie_trenera='Maro' WHERE Nazwisko_trenera='Cybulski';
	
	/*
	Imie gracza  Nazwisko gracza  Nickname  Druzyna      Rezerwowy  Imie trenera  Nazwisko trenera
	-----------  ---------------  --------  -----------  ---------  ------------  ----------------
	Karol        Rodowicz    	  rallen    devils.one   Szpero     Mariusz       Cybulski
	Janusz   	 Pogorzelski  	  Snax      Virtus Pro   morelz     Jakub	      Garczynski
	Wiktor       Wojtas           Taz       devils.one   Szpero     Mariusz       Cybulski
	Nicolai      Reedtz           dev1ce    Astralis     Kjaerbye   Danny         Sorensen
	Peter        Rasmusseni       dupreeh   Astralis     Kjaerbye   Danny         Sorensen
	Andreas      Hojsleth         Xyp9x     Astralis     Kjaerbye   Danny         Sorensen
	Lukas        Rossander        gla1ve    Astralis     Kjaerbye   Danny         Sorensen
	Emil         Reif             Magisk    Astralis     Kjaerbye   Danny         Sorensen
	*/
	
	COMMIT
	
	CREATE OR REPLACE VIEW 
	V_TUR_SPO_ORG
	(Nazwa_turnieju_offline, Zwyciezca, Pula_nagrod, Data_rozgrywek, Miejsce_rozgrywek, Sponsor, Organizator)
	AS 
	SELECT v.TUROF_NAZWA_TURNIEJU, v.TUROF_ZWYCIEZCA, v.TUROF_PULA_NAGROD, v.TUROF_DATA_ROZGRYWEK, v.TUROF_MIEJSCE_ROZGRYWEK, v.SPO_NAZWA, v.ORG_NAZWA
	FROM (
		SELECT *
		FROM TURNIEJ_OFFLINE a, SPONSOR b, ORGANIZATOR c
		WHERE  a.SPO_ID = b.SPOk_1_ID AND a.ORG_ID = c.ORGk_1_ID
		)v;
		
		create or replace trigger T_V_TUR_SPO_ORG
		INSTEAD OF INSERT ON V_TUR_SPO_ORG
		begin
		INSERT INTO TURNIEJ_OFFLINE			VALUES (NULL, :new.Nazwa_turnieju_offline, :new.Zwyciezca, :new.Pula_nagrod, :new.Data_rozgrywek, :new.Miejsce_rozgrywek, NULL, NULL);
		INSERT INTO SPONSOR					VALUES (NULL, :new.Sponsor, NULL);
		INSERT INTO ORGANIZATOR				VALUES (NULL, :new.Organizator, NULL, NULL);
		end;
		/
		SELECT * 
	FROM V_TUR_SPO_ORG;
		
	/*
	Nazwa turnieju offline           Zwyciezca  Pula nagrod  Data rozgrywek  Miejsce rozgrywek  Sponsor     Organizator  
	-------------------------------  ---------  -----------  --------------  -----------------  ----------  -----------
	IEM Katowice 2019                Astralis   1000000      2019-02-20      Katowice,Poland    Intel       ESL
	BLAST Pro Series Sao Paulo 2019  Astralis   250000       2019-03-22      Sao Paulo,Brazil   OMEN by HP  RFRSH
	WESG 2018 World Finals   	     Windigo  	890000       2019-03-11      Chongqing,China    HyperX      Alisports
	*/
	
	INSERT INTO V_TUR_SPO_ORG VALUES ('PGL Major Krakow 2017','Gambit','1000000','2017-06-16','Krakow,Poland','HyperX','PGL');
	SELECT * FROM V_TUR_SPO_ORG;
	
	/*
	Nazwa turnieju offline           Zwyciezca  Pula nagrod  Data rozgrywek  Miejsce rozgrywek  Sponsor     Organizator  
	-------------------------------  ---------  -----------  --------------  -----------------  ----------  -----------
	IEM Katowice 2019                Astralis   1000000      2019-02-20      Katowice,Poland    Intel       ESL
	BLAST Pro Series Sao Paulo 2019  Astralis   250000       2019-03-22      Sao Paulo,Brazil   OMEN by HP  RFRSH
	WESG 2018 World Finals   	     Windigo  	890000       2019-03-11      Chongqing,China    HyperX      Alisports
	PGL Major Krakow 2017            Gambit     1000000      2017-06-16      Krakow,Poland      HyperX      PGL
	*/
	
	DELETE V_TUR_SPO_ORG WHERE Nazwa_turnieju_offline = 'IEM Katowice 2019';
	SELECT * FROM V_TUR_SPO_ORG;
	
	/*
	Nazwa turnieju offline           Zwyciezca  Pula nagrod  Data rozgrywek  Miejsce rozgrywek  Sponsor     Organizator  
	-------------------------------  ---------  -----------  --------------  -----------------  ----------  -----------
	BLAST Pro Series Sao Paulo 2019  Astralis   250000       2019-03-22      Sao Paulo,Brazil   OMEN by HP  RFRSH
	WESG 2018 World Finals   	     Windigo  	890000       2019-03-11      Chongqing,China    HyperX      Alisports
	PGL Major Krakow 2017            Gambit     1000000      2017-06-16      Krakow,Poland      HyperX      PGL
	*/
	
	UPDATE V_TUR_SPO_ORG SET Pula_nagrod = 1 WHERE Organizator = 'Alisports';
	SELECT * FROM V_TUR_SPO_ORG;
	
	/*
	Nazwa turnieju offline           Zwyciezca  Pula nagrod  Data rozgrywek  Miejsce rozgrywek  Sponsor     Organizator  
	-------------------------------  ---------  -----------  --------------  -----------------  ----------  -----------
	BLAST Pro Series Sao Paulo 2019  Astralis   250000       2019-03-22      Sao Paulo,Brazil   OMEN by HP  RFRSH
	WESG 2018 World Finals   	     Windigo  	1            2019-03-11      Chongqing,China    HyperX      Alisports
	PGL Major Krakow 2017            Gambit     1000000      2017-06-16      Krakow,Poland      HyperX      PGL
	*/
	
	ROLLBACK
	
	--------------------------------------------------------------------------------------------------------------------------------
	--SELECTY DO INDEXOW----------------
	--------------------------------------------------------------------------------------------------------------------------------
	
	SELECT * FROM SPONSOR WHERE UPPER(SPO_NAZWA) LIKE 'I%';
	/*
	 ID  Nazwa sponsora  Podmiot sponsoringu
	---  --------------  ------------------------------------
     4   Intel           Intel Extreme Masters: Katowice 2019
	*/
	
	SELECT * FROM Organizator WHERE UPPER(ORG_NAZWA) LIKE 'P%';
	/*
     ID  Nazwa organizatora  Podmiot organizowany    ID sponsora
	---  ------------------  ----------------------  -----------
	 2   PGL                 PGL Major: Kraków 2017  5
	*/


	SELECT * FROM GRACZ WHERE UPPER(GRA_IMIE) LIKE 'K%';
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1	 Karol     Rodowicz     rallen       Polska      24    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016                        1
	*/
	
	--------------------------------------------------
	---------PROCEDURE LICZNIK+1----------------------
	--------------------------------------------------

	CREATE or REPLACE PROCEDURE INSERT_GRA(ILE IN number)
	IS
	LICZNIK number(2);
	BEGIN
	LICZNIK := 1;
	WHILE LICZNIK < ILE+1
	LOOP
		INSERT INTO GRACZ(GRA_IMIE, GRA_NAZWISKO, GRA_NICKNAME) VALUES(LICZNIK||'Filip', LICZNIK||'Kubski', LICZNIK||'Neo');
		LICZNIK := LICZNIK + 1;
	END LOOP;
	END;
	/ 
	BEGIN
	INSERT_GRA(5); 
	END;
	/ 
	select * from GRACZ;
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1	 Karol     Rodowicz     rallen       Polska      24    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016                        1
	2	 Grzegorz  Dziamalek    Szpero       Polska      27    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  2      
	3	 Janusz    Pogorzelski  Snax         Polska      25    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          									   3
	4	 Nicolai   Reedtz       dev1ce       Polska      25    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	  
	5	 Peter     Rasmusseni   dupreeh      Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4
	6	 Andreas   Hojsleth     Xyp9x        Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	7	 Lukas     Rossander    gla1ve       Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	8	 Emil      Reif         Magisk       Polska      21    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4 
	9    Wiktor    Wojtas       Taz                                                                                                                                                        1
	10   1Filip    1Kubski      1Neo
	11   2Filip    2Kubski      2Neo
	12   3Filip    3Kubski      3Neo
	13   4Filip    4Kubski      4Neo
	14   5Filip    5Kubski      5Neo

	*/
		----------------------------------------------------------------------------------------------------------

	CREATE OR REPLACE PROCEDURE OFE_DODAJ_GRA
	IS
			licznik number(2);
	BEGIN
			licznik := 1;
			FOR licznik IN 1..3
			LOOP
				INSERT INTO GRACZ
				(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME)
				VALUES ('Pawel','Mocek','Innocent');
			END LOOP;
	END;
	/
	BEGIN
			OFE_DODAJ_GRA;
	END;
	/

	SELECT * FROM GRACZ;
	
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1	 Karol     Rodowicz     rallen       Polska      24    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016                        1
	2	 Grzegorz  Dziamalek    Szpero       Polska      27    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  2      
	3	 Janusz    Pogorzelski  Snax         Polska      25    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          									   3
	4	 Nicolai   Reedtz       dev1ce       Polska      25    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	  
	5	 Peter     Rasmusseni   dupreeh      Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4
	6	 Andreas   Hojsleth     Xyp9x        Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	7	 Lukas     Rossander    gla1ve       Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	8	 Emil      Reif         Magisk       Polska      21    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4 
	9    Wiktor    Wojtas       Taz                                                                                                                                                        1
	10   1Filip    1Kubski      1Neo
	11   2Filip    2Kubski      2Neo
	12   3Filip    3Kubski      3Neo
	13   4Filip    4Kubski      4Neo
	14   5Filip    5Kubski      5Neo
	15   Pawel     Mocek        Innocent
    17   Pawel     Mocek        Innocent
	*/
	
	----------------------------------------
------------FUNCTION--------------------
----------------------------------------

CREATE OR REPLACE FUNCTION liczba_GRA (GRA_zad IN number)
RETURN NUMBER IS 
liczba NUMBER(3);
	BEGIN
			IF GRA_zad IS NULL THEN
			DBMS_OUTPUT.PUT_LINE('Brak zadan do wykonania');
			ELSIF GRA_zad = 1 THEN
			SELECT count(*) INTO liczba FROM GRACZ;
			ELSE
			DBMS_OUTPUT.PUT_LINE('Nieznana komenda');
			END IF;
			RETURN liczba;
	END;
	/
BEGIN
		DBMS_OUTPUT.PUT_LINE(liczba_GRA);
END;


	----------------------------------------
	------------FUNCTION--------------------
	----------------------------------------
	
	CREATE OR REPLACE FUNCTION fun_TRE(x IN NUMBER)
	RETURN VARCHAR2
	IS
	BEGIN
	IF(x>1) THEN
		INSERT INTO TRENER(TRE_IMIE, TRE_NAZWISKO,TRE_NICKNAME,TRE_NARODOWOSC,TRE_WIEK,TRE_OSIAGNIECIA) VALUES ('Eric','Hoag','AdreN', 'United States', '29', ' 1st BUYPOWER Masters IV, 1st Intel Extreme Masters XIV - Sydney, 2nd BLAST Pro Series: Miami 2019');
		RETURN 'Dodano AdreNa';
	ELSIF(x<1) THEN
		INSERT INTO TRENER(TRE_IMIE, TRE_NAZWISKO,TRE_NICKNAME) VALUES ('Jimmy','Jumpy', 'Berndtsson');
		RETURN 'Dodano Jimmiego';
	ELSE 
		INSERT INTO TRENER(TRE_IMIE, TRE_NAZWISKO,TRE_NICKNAME) VALUES ('Allan','Rejin', 'Petersen');
		RETURN 'Dodano Allana';
	END IF;
	END;
	/ 
	BEGIN
	DBMS_OUTPUT.PUT_LINE(fun_TRE(2)); --Dodano AdreNa
	END;
	/ 

	select * from TRENER;
	
	/*
	ID   Imie  	 Nazwisko    Nickname	  Narodowosc       Wiek  Osiagniecia 
	---  -------  ---------- -----------  ----------       ----  --------------------------------------------------------------------------------------------------------------------------
	1	 Mariusz  Cybulski    Loord        Polska          34    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016         
	2	 Mikolaj  Michalkow   miNirox      Polska     	   21    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018          
	3	 Jakub    Garczynski  kuben        Polska     	   30    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          
	4    Danny    Sorensen    zonic        Denmark    	   32    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018
	5    Mariusz  Cybulski  
	6    Eric     Hoag        AdreN        United States   29    1st BUYPOWER Masters IV, 1st Intel Extreme Masters XIV - Sydney, 2nd BLAST Pro Series: Miami 2019
	*/
	
	----------------------------------------
	------------PROCEDURE-------------------
	----------------------------------------
	
	CREATE or REPLACE PROCEDURE PROC_DRU_GRA_INSERT
	(
	nazwa_dru IN DRUZYNA.DRU_NAZWA%TYPE,
	organizacja_dru IN DRUZYNA.DRU_ORGANIZACJA%TYPE,
	id_tre IN DRUZYNA.TRE_ID%TYPE,
	imie_gra IN GRACZ.GRA_IMIE%TYPE,
	nazwisko_gra IN GRACZ.GRA_NAZWISKO%TYPE,
	nickname_gra IN GRACZ.GRA_NICKNAME%TYPE
	)
	IS

	id_DRU DRUZYNA.DRUk_1_ID%TYPE;
	id_GRA GRACZ.GRAk_1_ID%TYPE;
	BEGIN

			INSERT INTO DRUZYNA(DRU_NAZWA, DRU_ORGANIZACJA, TRE_ID) VALUES (nazwa_dru,organizacja_dru,id_tre) RETURNING DRUk_1_ID INTO id_DRU;
			INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO,GRA_NICKNAME) VALUES (imie_gra,nazwisko_gra,nickname_gra) RETURNING GRAk_1_ID INTO id_GRA;
			dbms_output.put_line('id_DRU= '||id_DRU||' id_GRA= '||id_GRA);
			--id_DRU= 6 id_GRA= 6
	END;
	/ 
	BEGIN
		PROC_DRU_GRA_INSERT('ENCE','ENCE eSports',3,'Aleksi','Jalli','allu'); 
	END;
	/

	SELECT * FROM GRACZ WHERE UPPER(GRA_IMIE) LIKE 'A%';
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	15   Aleksi    Jalli        allu
	6    Andreas   Hojsleth     Xyp9x        Denmark     23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4
	*/
	
	-----------------------------------------------
	---------PROCEDURE UPDATE----------------------
	-----------------------------------------------	
	
	CREATE OR REPLACE PROCEDURE PROC_UPDATE
	(
	WiekGraczaPrzedUro IN GRACZ.GRA_WIEK%TYPE,
	WiekGraczaPoUro IN GRACZ.GRA_WIEK%TYPE
	
	)
	IS
	BEGIN
	 
	 
	UPDATE GRACZ SET GRA_WIEK = WiekGraczaPoUro WHERE GRA_WIEK = WiekGraczaPrzedUro;
	 
	FOR plan IN (SELECT GRA_WIEK FROM GRACZ WHERE GRA_WIEK = WiekGraczaPrzedUro)
	LOOP
		UPDATE GRACZ SET GRA_WIEK = WiekGraczaPoUro WHERE GRA_WIEK = WiekGraczaPrzedUro;
	 
		IF SQL%rowcount = 0 THEN
			INSERT INTO GRACZ(GRA_IMIE, GRA_NAZWISKO, GRA_NICKNAME, GRA_NARODOWOSC, GRA_WIEK, GRA_OSIAGNIECIA, DRU_ID) VALUES ('Karol','Rodowicz','rallen','Poland','25','1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016',1);
		END IF;
	 
	END LOOP;
	 
	END;
	/

	BEGIN
		PROC_UPDATE('24','25'); 
	END;
	/
	SELECT * FROM GRACZ WHERE UPPER(GRA_IMIE) LIKE 'K%';
	
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1    Karol     Rodowicz     rallen       Poland      25    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electron ic Sports Games 2016                       1
    */
	
	--------------------------------------------------
	---------PROCEDURE CHECK--------------------------
	--------------------------------------------------	
	
		CREATE OR REPLACE PROCEDURE cursor_check
	IS
		nazwa_dru DRUZYNA.DRU_NAZWA%TYPE;
		organizacja_dru DRUZYNA.DRU_ORGANIZACJA%TYPE;
		osiagniecia_dru DRUZYNA.DRU_OSIAGNIECIA%TYPE;
		imie_gra GRACZ.GRA_IMIE%TYPE;
		nazwisko_gra GRACZ.GRA_NAZWISKO%TYPE;
		nickname_gra GRACZ.GRA_NICKNAME%TYPE;
		imie_tre TRENER.TRE_IMIE%TYPE;
		nazwisko_tre TRENER.TRE_NAZWISKO%TYPE;
		nickname_tre TRENER.TRE_NICKNAME%TYPE;
		
	CURSOR cu_uzy
	IS
	SELECT d.DRU_NAZWA, d.DRU_ORGANIZACJA, d.DRU_OSIAGNIECIA, g.GRA_IMIE, g.GRA_NAZWISKO, g.GRA_NICKNAME, t.TRE_IMIE, t.TRE_NAZWISKO, t.TRE_NICKNAME
	FROM DRUZYNA d, GRACZ g, TRENER t
	WHERE d.TRE_ID = t.TREk_1_ID AND g.DRU_ID = d.DRUk_1_ID ;
	BEGIN
	OPEN cu_uzy;
	LOOP
		FETCH cu_uzy INTO
		nazwa_dru, organizacja_dru, osiagniecia_dru, imie_gra, nazwisko_gra, nickname_gra, imie_tre, nazwisko_tre, nickname_tre;
		EXIT WHEN cu_uzy%NOTFOUND
		OR cu_uzy%ROWCOUNT <1;

	DBMS_OUTPUT.PUT_LINE('Druzyna '||nazwa_dru||', organizacja: '||organizacja_dru||', osiagniecia: '||osiagniecia_dru||'. Gra w niej: '||imie_gra||'  '||nazwisko_gra||'  '||nickname_gra||'. Trener druzyny: '||imie_tre||'  '||nazwisko_tre||'  '||nickname_tre);
	END LOOP;
	END;
	/

	BEGIN
	cursor_check();
	END;
	/
	
	/*
	Druzyna devils.one, organizacja: devils.one, osiagniecia: 1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016. Gra w niej: Karol  Rodowicz  rallen. Trener druzyny: Mariusz  Cybulski  Loord
	Druzyna Virtus Pro, organizacja: Virtus Pro, osiagniecia: 2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1. Gra w niej: Janusz  Pogorzelski  Sn. Trener druzyny: Jakub  Garczynski  kuben
	Druzyna Astralis, organizacja: Astralis, osiagniecia: 1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018. Gra w niej: Nicolai  Reedtz  dev1ce. Trener druzyny: Danny  Sorensen  zonic
	Druzyna Astralis, organizacja: Astralis, osiagniecia: 1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018. Gra w niej: Peter  Rasmusseni  dupreeh. Trener druzyny: Danny       Sorensen  zonic
	Druzyna Astralis, organizacja: Astralis, osiagniecia: 1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018. Gra w niej: Andreas  Hojsleth  Xyp9x. Trener druzyny: Danny  Sorensen       zonic
	Druzyna Astralis, organizacja: Astralis, osiagniecia: 1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018. Gra w niej: Lukas  Rossander  gla1ve. Trener druzyny: Danny  Sorensen       zonic
	Druzyna Astralis, organizacja: Astralis, osiagniecia: 1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018. Gra w niej: Emil  Reif  Magisk. Trener druzyny: Danny  Sorensen  zonic
	Druzyna devils.one, organizacja: devils.one, osiagniecia: 1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016. Gra w niej: Wiktor  Wojtas  Taz. Trener druzyny: Mariusz  Cybulski  Loord
	*/
	
	----------------------------------------
	------------NUMBER CHECK----------------
	----------------------------------------
	
	create or replace procedure poprawnywiek
		is
		numer EXCEPTION;
		PRAGMA EXCEPTION_INIT(numer, -20002);
			type numer_check is record(
				ID 		TRENER.TREk_1_ID%type,
				WIEK 	TRENER.TRE_WIEK%type
			);
			
			cursor NUMER_cursor
			is
				select TREk_1_ID, TRE_WIEK
				from TRENER;
				
			SPR_NUMER numer_check;
				
			begin
				open NUMER_cursor;
				loop
					fetch NUMER_cursor into SPR_NUMER;
					exit when
						NUMER_cursor%NOTFOUND OR NUMER_cursor%ROWCOUNT < 1;

					if SPR_NUMER.WIEK <= 18
					then
						RAISE_APPLICATION_ERROR(-20002, 'Zbyt mlody wiek trenera o ID '||SPR_NUMER.ID);
					
					elsif SPR_NUMER.WIEK >= 18
					then
						DBMS_OUTPUT.PUT_LINE('Prawidlowy wiek trenera o ID '||SPR_NUMER.ID);
					end if;				
				end loop;
					
				close NUMER_cursor;
				
		exception
			when numer
			then
				DBMS_OUTPUT.PUT_LINE('ORA-'||SQLCODE||SQLERRM);
			when INVALID_NUMBER
			then
				DBMS_OUTPUT.PUT_LINE('Wystapil blad INVALID_NUMBER');
			when VALUE_ERROR
			then
				DBMS_OUTPUT.PUT_LINE('Wystapil blad VALUE_ERROR');
			when others
			then
				DBMS_OUTPUT.PUT_LINE('Brak wieku');
			end;
	/
	
	END;
	/ 
	BEGIN
	poprawnywiek;
	END;
	/
	
	
	SELECT * FROM TRENER WHERE UPPER(TRE_IMIE) LIKE 'M%';
	
	ORA--20002ORA-20002: Zbyt mlody wiek trenera o ID 1
	
	/*
	ID   Imie  	  Nazwisko    Nickname	   Narodowosc  Wiek  Osiagniecia 
	---  -------  ----------  -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------
	1	 Mariusz  Cybulski    Loord        Polska      17    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016         
	2	 Mikolaj  Michalkow   miNirox      Polska      21    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018          
	*/
	
  
	
	----------------------------------------
	---LENGHT CHECK-------------------------
	----------------------------------------
	
	create or replace procedure dlugoscnickname
		is
		nickname_valid EXCEPTION;
		PRAGMA EXCEPTION_INIT(nickname_valid, -20003);
			type nickname_check is record(
				ID 			GRACZ.GRAk_1_ID%type,
				NICKNAME 	GRACZ.GRA_NICKNAME%type
			);
			
			cursor Nickname_cursor
			is
				select GRAk_1_ID, GRA_NICKNAME
				from GRACZ;
				
			SPR_NICKNAME nickname_check;
				
			begin
				open Nickname_cursor;
				loop
					fetch Nickname_cursor into SPR_NICKNAME;
					exit when
						Nickname_cursor%NOTFOUND OR Nickname_cursor%ROWCOUNT < 1;
						
					if LENGTH(SPR_NICKNAME.Nickname) < 3
					then
						RAISE_APPLICATION_ERROR(-20003, 'Nickname zawodnika o ID '||SPR_NICKNAME.ID|| ' musi byc dlugi na conajmniej 3 znaki');

					elsif LENGTH(SPR_NICKNAME.Nickname) >= 3
					then
						UPDATE GRACZ
						SET GRA_NICKNAME ='  ' ||SPR_NICKNAME.Nickname 
						WHERE GRAk_1_ID = SPR_NICKNAME.ID;
					end if;				
				end loop;
					
				close Nickname_cursor;
		exception
			when nickname_valid
			then
				DBMS_OUTPUT.PUT_LINE('ORA-'||SQLCODE||SQLERRM);
			when INVALID_NUMBER
			then
				DBMS_OUTPUT.PUT_LINE('Wystapil blad INVALID_NUMBER');
			when VALUE_ERROR
			then
				DBMS_OUTPUT.PUT_LINE('Wystapil blad VALUE_ERROR');
			when others
			then
				DBMS_OUTPUT.PUT_LINE('Brak gracza');
			END;
	/ 
	BEGIN
	dlugoscnickname;
	END;
	/

	/
	SELECT * FROM GRACZ WHERE UPPER(GRA_NICKNAME) LIKE 'S%';
	/*
	ORA--20003ORA-20003: Nickname zawodnika o ID 3 musi byc dlugi na conajmniej 3 znaki
	
	
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	2	 Grzegorz  Dziamalek    Szpero       Polska      27    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  2      
	3	 Janusz    Pogorzelski  Sn           Polska      25    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          									   3
	
	*/
	
	------------------------------------------------------
	-------------RANDOM GRACZ-----------------------------
	------------------------------------------------------
	CREATE OR REPLACE PROCEDURE rand_insert(ile IN NUMBER)
	AS
		ID_GRA GRACZ.GRAk_1_ID%TYPE;
		licznik number(2);
		
		type imie is varray(8) of varchar2(15);
		type naz is varray(5) of varchar2(15);
		type nick is varray(6) of varchar2(15);
		type wiek is varray(6) of number(5);
		type nazw is varray(7) of varchar2(15);
		
		tmp_imie GRACZ.GRA_IMIE%type;
		tmp_naz GRACZ.GRA_NAZWISKO%type;
		tmp_nick GRACZ.GRA_NICKNAME%type;
		tmp_wiek GRACZ.GRA_WIEK%type;
		tmp_nazw DRUZYNA.DRU_NAZWA%type;
		
		Imiona imie:= imie('Bartosz','Jan','Dawid','Kamil','Zdzislaw');
		Nazwiska naz := naz ('Tomanek','Szmyd','Gazda','Gruby','Jakis');
		Nicki nick := nick('Cursedise','Johny','Kuniz','Pivot','Zdzislaw');
		Lata wiek := wiek(20,21,18,21,21);
		NazwyDruzyn nazw := nazw('Unhjuman.Rec','NinjasInPijamas','MegaWensze9','Advokacik','X-kom');
		
		BEGIN
			licznik := 1;
			DBMS_RANDOM.INITIALIZE(562341);
			WHILE licznik < ile+1
			LOOP
				tmp_imie := Imiona(dbms_random.value(0,5));
				tmp_naz := Nazwiska(dbms_random.value(0,5));
				tmp_nick := Nicki(dbms_random.value(0,5));
				tmp_wiek := Lata(dbms_random.value(0,5));
				tmp_nazw := NazwyDruzyn(dbms_random.value(0,5));
				
				INSERT INTO DRUZYNA(DRU_NAZWA,DRU_LOGO,DRU_ORGANIZACJA,DRU_OSIAGNIECIA,DRU_REZERWOWY)
					VALUES (tmp_nazw,'none','Arcy','1st ESL Mistrzostwa Polski','Szperek');
						
				INSERT INTO GRACZ(GRA_IMIE,GRA_NAZWISKO, GRA_NICKNAME, GRA_NARODOWOSC, GRA_WIEK,GRA_OSIAGNIECIA) 
				 VALUES (tmp_imie,tmp_naz,tmp_nick,'Poland',tmp_wiek,'none')
						RETURNING GRACZ.GRAk_1_ID into ID_GRA;

				licznik:=licznik+1;
			END LOOP;

		exception
		
		when INVALID_NUMBER
		then
			DBMS_OUTPUT.PUT_LINE('Wystapil blad INVALID_NUMBER');
			
		when VALUE_ERROR
		then
			DBMS_OUTPUT.PUT_LINE('Wystapil blad VALUE_ERROR');
			
			when others then
				dbms_output.put_line('Wystapil blad: '||SQLERRM);
		END;
	/

	BEGIN
	rand_insert(7);
	END;
	/
	
	SELECT * FROM GRACZ;
	/*
	ID   Imie  	   Nazwisko     Nickname	 Narodowosc  Wiek  Osiagniecia 																												   ID Druzyny
	---  -----     ----------   -----------  ----------  ----  --------------------------------------------------------------------------------------------------------------------------  ---------
	1	 Karol     Rodowicz     rallen       Polska      24    1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016                        1
	2	 Grzegorz  Dziamalek    Szpero       Polska      27    2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  2      
	3	 Janusz    Pogorzelski  Snax         Polska      25    2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1          									   3
	4	 Nicolai   Reedtz       dev1ce       Polska      25    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	  
	5	 Peter     Rasmusseni   dupreeh      Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4
	6	 Andreas   Hojsleth     Xyp9x        Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	7	 Lukas     Rossander    gla1ve       Polska      23    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4	
	8	 Emil      Reif         Magisk       Polska      21    1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   4 
	9    Wiktor    Wojtas       Taz                                                                                                                                                        1
	10   1Filip    1Kubski      1Neo
	11   2Filip    2Kubski      2Neo
	12   3Filip    3Kubski      3Neo
	13   4Filip    4Kubski      4Neo
	14   5Filip    5Kubski      5Neo
	15   Pawel     Mocek        Innocent
    16   Pawel     Mocek        Innocent
	17   Aleksi    Jalli        allu
	18   Dawid     Gruby        Zdzislaw     Poland      20    none
	19   Pawel     Mocek        Innocent
    20   Pawel     Mocek        Innocent
	*/
	
	
	SELECT * FROM DRUZYNA;
	/*
	ID   Nazwa        Logo  Organizacja  Osiagniecia       																										     Rezerwowy  ID trenera  ID sponsora
	---  -----------  ----  -----------  --------------------------------------------------------------------------------------------------------------------------  ---------  ----------  -----------
	1    devils.one         devils.one   1st DreamHack Open Montreal 2018, 2nd ZOTAC Cup Masters 2018, 2nd World Electronic Sports Games 2016      					 reatz      1           1
	2	 AGO Esports        AGO Esports  2nd World Electronic Sports Games 2018, 2nd ESL Pro European Championship 2018, 3rd - 4th TOYOTA Master CS:GO Bangkok 2018  TOAO       2           2
	3    Virtus Pro         Virtus Pro   2nd EPICENTER 2017, 1st DreamHack Masters Las Vegas 2017, 1st ELEAGUE Season 1												 morelz     3           3
	4    Astralis           Astralis     1st Intel Extreme Masters XIII - Katowice Major 2019, 1st ESL Pro League Season 8 - Finals, 1st FACEIT Major: London 2018   Kjaerbye   4           10
	5    devils.one                                                                                                                                                  reatz
    6    ENCE               ENCE eSports                                                                                                                                        3
	7    Unhjuman.Rec none  Arcy         1st ESL Mistrzostwa Polski                                                                                                  Szperek
	*/
	