CREATE TABLE PRF_ACCESSO
   ("ID_ACCESSO" CHAR(1) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"ORDINE" NUMBER(5,0) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL)
 

   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."UT_MODIFICA" IS 'tecnici';
   
   ALTER TABLE PRF_ACCESSO
   ADD CONSTRAINT PRF_ACCESSO_PK PRIMARY KEY (ID_ACCESSO);
   
   ALTER TABLE PRF_ACCESSO ADD CONSTRAINT "PRF_ACCESSO_UQ" UNIQUE ("DESCRIZIONE","ORDINE");
   
   
   
   CREATE TABLE PRF_APPLICAZIONE
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL, 
	"ID_STATO" CHAR (1) NOT NULL,
    "CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"CODICE_DOMINIO_BASE" VARCHAR2(16) NOT NULL, 
	"PROFILAZIONE_DATI" CHAR(1) NOT NULL, 
	"SALTA_PROFILAZIONE" CHAR(1) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL)
	 

   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_APPLICAZIONE_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_APPLICAZIONE_TRG
  BEFORE INSERT ON PRF_APPLICAZIONE
  FOR EACH ROW
BEGIN
  :NEW.ID_APPLICAZIONE := PRF_APPLICAZIONE_seq.nextval;
END;
/
ALTER TRIGGER PRF_APPLICAZIONE_TRG ENABLE;

ALTER TABLE PRF_APPLICAZIONE
   ADD CONSTRAINT PRF_APPLICAZIONE_PK PRIMARY KEY (ID_APPLICAZIONE);
   
   ALTER TABLE PRF_APPLICAZIONE ADD CONSTRAINT "PRF_APPLICAZIONE_UQ" UNIQUE ("CODICE");
   
   ALTER TABLE PRF_APPLICAZIONE
ADD CONSTRAINT PRF_CK_APP_PROFILAZIONE_DATI CHECK (PROFILAZIONE_DATI IN ('Y','N') );

ALTER TABLE PRF_APPLICAZIONE
    ADD CONSTRAINT PRF_CK_APP_SALTA_PROFILAZIONE CHECK (SALTA_PROFILAZIONE IN ('Y','N'));
    
    


CREATE TABLE PRF_AREA
   ("ID_AREA" NUMBER(22,0) NOT NULL, 
   "ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
   "ID_STATO" CHAR(1) NOT NULL,
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
	 
 

   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_AREA_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_AREA_TRG
  BEFORE INSERT ON PRF_AREA
  FOR EACH ROW
BEGIN
  :NEW.ID_AREA := PRF_AREA_seq.nextval;
END;
/
ALTER TRIGGER PRF_AREA_TRG ENABLE;

ALTER TABLE PRF_AREA
   ADD CONSTRAINT PRF_AREA_PK PRIMARY KEY (ID_AREA);
   
    ALTER TABLE PRF_AREA ADD CONSTRAINT "PRF_AREA_UQ" UNIQUE ("CODICE");
    
   

CREATE TABLE PRF_AREA_FILTRO
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_AREA" NUMBER(22,0) NOT NULL,
    "ID_LIVELLO" NUMBER(10,0) NOT NULL,
    "ID_FILTRO" NUMBER(22,0) NOT NULL,
    "TS_CREAZIONE" TIMESTAMP(6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
    
    
    
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."UT_MODIFICA" IS 'tecnici';
   
    
   
   CREATE INDEX PRF_AREA_FILTRO_APP_LIVELLO ON PRF_AREA_FILTRO ("ID_APPLICAZIONE", "ID_LIVELLO");


CREATE TABLE PRF_FILTRO
   ("ID_APPLICAZIONE" NUMBER(10,0)NOT NULL,
   "ID_LIVELLO" NUMBER(10,0) NOT NULL,
   "ID_FILTRO" NUMBER(22,0) NOT NULL, 
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"DESCRIZIONE_LUNGA" VARCHAR2(256) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
	
 

   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_FILTRO_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_FILTRO_ID_TRG
  BEFORE INSERT ON PRF_FILTRO
  FOR EACH ROW
BEGIN
  :NEW.ID_FILTRO := PRF_FILTRO_seq.nextval;
END;
/
ALTER TRIGGER PRF_FILTRO_ID_TRG ENABLE;

ALTER TABLE PRF_FILTRO
   ADD CONSTRAINT PRF_FILTRO_PK PRIMARY KEY (ID_FILTRO);
   
   ALTER TABLE PRF_FILTRO ADD CONSTRAINT "PRF_FILTRO_UQ" UNIQUE ("CODICE");
   
    
    
    
CREATE TABLE PRF_FUNZIONE
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_FUNZIONE" NUMBER(22,0) NOT NULL, 
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL)

 

   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_FUNZIONE_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_FUNZIONE_TRG
  BEFORE INSERT ON PRF_FUNZIONE
  FOR EACH ROW
BEGIN
  :NEW.ID_FUNZIONE := PRF_FUNZIONE_seq.nextval;
END;
/
ALTER TRIGGER PRF_FUNZIONE_TRG ENABLE;

ALTER TABLE PRF_FUNZIONE
   ADD CONSTRAINT PRF_FUNZIONE_PK PRIMARY KEY (ID_FUNZIONE);
   
   ALTER TABLE PRF_FUNZIONE ADD CONSTRAINT "PRF_FUNZIONE_UQ" UNIQUE ("CODICE");
   
    
    
CREATE TABLE PRF_LIVELLO
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_LIVELLO" NUMBER(10,0) NOT NULL, 
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"ORDINE" NUMBER(5,0) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL)
	
 

   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_LIVELLO_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_LIVELLO_TRG
  BEFORE INSERT ON PRF_LIVELLO
  FOR EACH ROW
BEGIN
  :NEW.ID_LIVELLO := PRF_LIVELLO_seq.nextval;
END;
/
ALTER TRIGGER PRF_LIVELLO_TRG ENABLE;

ALTER TABLE PRF_LIVELLO
   ADD CONSTRAINT PRF_LIVELLO_PK PRIMARY KEY (ID_LIVELLO);
   
   ALTER TABLE PRF_LIVELLO ADD CONSTRAINT "PRF_LIVELLO_UQ" UNIQUE ("CODICE");
   
    


CREATE TABLE PRF_MENU
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_MENU" NUMBER(22,0) NOT NULL, 
    "ID_MENU_PADRE" NUMBER(22,0) NOT NULL,
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"URL" VARCHAR2(256) NOT NULL, 
	"ORDINE" NUMBER(5,0) NOT NULL, 
	"TS_CRAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL)
	 
 

   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."TS_CRAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_MENU_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_MENU_TRG
  BEFORE INSERT ON PRF_MENU
  FOR EACH ROW
BEGIN
  :NEW.ID_MENU := PRF_MENU_seq.nextval;
END;
/
ALTER TRIGGER PRF_MENU_TRG ENABLE;

ALTER TABLE PRF_MENU
   ADD CONSTRAINT PRF_MENU_PK PRIMARY KEY (ID_MENU);
   
   CREATE INDEX PRF_MENU_UQ ON PRF_MENU ("ID_APPLICAZIONE", "ID_MENU_PADRE");
   
   ALTER TABLE PRF_MENU ADD CONSTRAINT PRF_MENU_ORDINE_UK UNIQUE ("ORDINE");
   
    

CREATE TABLE PRF_PARAMETRO
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_PARAMETRO" VARCHAR2(128) NOT NULL, 
	"VALORE" VARCHAR2(256) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
	
 

   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."UT_MODIFICA" IS 'tecnici';
   
   ALTER TABLE PRF_PARAMETRO
   ADD CONSTRAINT PRF_PARAMETRO_PK PRIMARY KEY (ID_PARAMETRO);
   
    
   

CREATE TABLE PRF_RUOLO
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_RUOLO" NUMBER(22,0) NOT NULL, 
    "ID_STATO" CHAR(1) NOT NULL,
	"CODICE" VARCHAR2(16) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
	
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."UT_MODIFICA" IS 'tecnici';
   
   CREATE SEQUENCE PRF_RUOLO_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_RUOLO_TRG
  BEFORE INSERT ON PRF_RUOLO
  FOR EACH ROW
BEGIN
  :NEW.ID_RUOLO := PRF_RUOLO_seq.nextval;
END;
/
ALTER TRIGGER PRF_RUOLO_TRG ENABLE;

ALTER TABLE PRF_RUOLO
   ADD CONSTRAINT PRF_RUOLO_PK PRIMARY KEY (ID_RUOLO);
   
   ALTER TABLE PRF_RUOLO ADD CONSTRAINT "PRF_RUOLO_UQ" UNIQUE ("CODICE");
   



CREATE TABLE PRF_RUOLO_FUNZIONE 
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_RUOLO" NUMBER(22,0) NOT NULL,
    "ID_FUNZIONE" NUMBER(22,0) NOT NULL,
    "ID_ACCESSO" CHAR(1) NOT NULL,
    "TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL)
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_FUNZIONE"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_FUNZIONE"."UT_CREAZIONE" IS 'tecnici';
   
   CREATE INDEX PRF_RUOLO_FUNZIONE_UQ ON PRF_RUOLO_FUNZIONE ("ID_APPLICAZIONE", "ID_RUOLO", "ID_FUNZIONE", "ID_ACCESSO");
   
   
   
   
   CREATE TABLE PRF_RUOLO_MENU
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_RUOLO" NUMBER(22,0) NOT NULL,
    "ID_MENU" NUMBER(22,0) NOT NULL,
    "TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL)
  
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_MENU"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_MENU"."UT_CREAZIONE" IS 'tecnici';
   
   CREATE INDEX PRF_RUOLO_MENU_UQ ON PRF_RUOLO_MENU ("ID_APPLICAZIONE", "ID_MENU");
   
   
   
   
   CREATE TABLE PRF_STATO
   ("ID_STATO" CHAR(1) NOT NULL, 
	"DESCRIZIONE" VARCHAR2(64) NOT NULL, 
	"ORDINE" NUMBER(5,0) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL) 
	 
 

   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."UT_MODIFICA" IS 'tecnici';
   
   ALTER TABLE PRF_STATO
   ADD CONSTRAINT PRF_STATO_PK PRIMARY KEY (ID_STATO);
   
   ALTER TABLE PRF_STATO ADD CONSTRAINT "PRF_STATO_UQ" UNIQUE ("DESCRIZIONE", "ORDINE");
   


CREATE TABLE PRF_UTENTE
   ("ID_UTENTE" NUMBER(22,0) NOT NULL,
    "ID_STATO" CHAR(1) NOT NULL,
	"USERNAME" VARCHAR2(16) NOT NULL, 
	"CODICE_DOMINIO" VARCHAR2(16) NOT NULL, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL, 
	"UT_MODIFICA" VARCHAR2(16) NOT NULL)
	
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."UT_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."TS_MODIFICA" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."UT_MODIFICA" IS 'tecnici';  
   
   
   CREATE SEQUENCE PRF_UTENTE_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 

  CREATE OR REPLACE TRIGGER PRF_UTENTE_TRG
  BEFORE INSERT ON PRF_UTENTE
  FOR EACH ROW
BEGIN
  :NEW.ID_UTENTE := PRF_UTENTE_seq.nextval;
END;
/
ALTER TRIGGER PRF_UTENTE_TRG ENABLE;

ALTER TABLE PRF_UTENTE
   ADD CONSTRAINT PRF_UTENTE_PK PRIMARY KEY (ID_UTENTE);
   
   ALTER TABLE PRF_UTENTE ADD CONSTRAINT "PRF_UTENTE_UQ" UNIQUE ("USERNAME");




CREATE TABLE PRF_UTENTE_AREA
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_UTENTE" NUMBER(22,0) NOT NULL,
    "ID_AREA" NUMBER(22,0) NOT NULL,
    "TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL)
  
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_AREA"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_AREA"."UT_CREAZIONE" IS 'tecnici';
   
   CREATE INDEX PRF_UTENTE_AREA_UQ ON PRF_UTENTE_AREA ("ID_APPLICAZIONE", "ID_AREA");
   
    


CREATE TABLE PRF_UTENTE_RUOLO
   ("ID_APPLICAZIONE" NUMBER(10,0) NOT NULL,
    "ID_UTENTE" NUMBER(22,0) NOT NULL,
    "ID_RUOLO" NUMBER(22,0),
    "TS_CREAZIONE" TIMESTAMP (6) NOT NULL, 
	"UT_CREAZIONE" VARCHAR2(16) NOT NULL) 
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_RUOLO"."TS_CREAZIONE" IS 'tecnici';
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_RUOLO"."UT_CREAZIONE" IS 'tecnici';
   
   CREATE INDEX PRF_UTENTE_RUOLO_UQ ON PRF_UTENTE_RUOLO ("ID_APPLICAZIONE", "ID_RUOLO");
   
   
   ALTER TABLE PRF_APPLICAZIONE
    ADD CONSTRAINT FK_PRF_APPLICAZIONE
    FOREIGN KEY (ID_STATO)
    REFERENCES PRF_STATO(ID_STATO);
    
     ALTER TABLE PRF_AREA
    ADD CONSTRAINT FK_PRF_AREA_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_AREA
    ADD CONSTRAINT FK_PRF_AREA_STA
    FOREIGN KEY (ID_STATO)
    REFERENCES PRF_STATO(ID_STATO);
    
    ALTER TABLE PRF_AREA_FILTRO
    ADD CONSTRAINT FK_PRF_ARIA_FILTRO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_AREA_FILTRO
    ADD CONSTRAINT FK_PRF_ARIA_FILTRO_AREA
    FOREIGN KEY (ID_AREA)
    REFERENCES PRF_AREA(ID_AREA);
    
    ALTER TABLE PRF_AREA_FILTRO
    ADD CONSTRAINT FK_PRF_ARIA_FILTRO_LIV
    FOREIGN KEY (ID_LIVELLO)
    REFERENCES PRF_LIVELLO(ID_LIVELLO);
    
    ALTER TABLE PRF_AREA_FILTRO
    ADD CONSTRAINT FK_PRF_ARIA_FILTRO_FIL
    FOREIGN KEY (ID_FILTRO)
    REFERENCES PRF_FILTRO(ID_FILTRO);
    
    ALTER TABLE PRF_FILTRO
    ADD CONSTRAINT FK_PRF_FILTRO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_FILTRO
    ADD CONSTRAINT FK_PRF_FILTRO_LIV
    FOREIGN KEY (ID_LIVELLO)
    REFERENCES PRF_LIVELLO(ID_LIVELLO);
    
    ALTER TABLE PRF_FUNZIONE
    ADD CONSTRAINT FK_PRF_FUNZIONE_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_LIVELLO
    ADD CONSTRAINT FK_PRF_LIVELLO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_MENU
    ADD CONSTRAINT FK_PRF_MENU_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
     ALTER TABLE PRF_MENU
     ADD CONSTRAINT FK_PRF_MENU_PADRE
     FOREIGN KEY (ID_MENU_PADRE)
     REFERENCES PRF_MENU(ID_MENU);
     
    ALTER TABLE PRF_PARAMETRO
    ADD CONSTRAINT FK_PRF_PARAMETRO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_RUOLO
    ADD CONSTRAINT FK_PRF_RUOLO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_RUOLO
    ADD CONSTRAINT FK_PRF_RUOLO_STA
    FOREIGN KEY (ID_STATO)
    REFERENCES PRF_STATO(ID_STATO);
    
    ALTER TABLE PRF_RUOLO_FUNZIONE
    ADD CONSTRAINT FK_PRF_RUOLO_FUNZIONE_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_RUOLO_FUNZIONE
    ADD CONSTRAINT FK_PRF_RUOLO_FUNZIONE_RUO
    FOREIGN KEY (ID_RUOLO)
    REFERENCES PRF_RUOLO(ID_RUOLO);
    
    ALTER TABLE PRF_RUOLO_FUNZIONE
    ADD CONSTRAINT FK_PRF_RUOLO_FUNZIONE_FUN
    FOREIGN KEY (ID_FUNZIONE)
    REFERENCES PRF_FUNZIONE(ID_FUNZIONE);
    
    ALTER TABLE PRF_RUOLO_FUNZIONE
    ADD CONSTRAINT FK_PRF_RUOLO_FUNZIONE_ACC
    FOREIGN KEY (ID_ACCESSO)
    REFERENCES PRF_ACCESSO(ID_ACCESSO);
    
    ALTER TABLE PRF_RUOLO_MENU
    ADD CONSTRAINT FK_PRF_RUOLO_MENU_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_RUOLO_MENU
    ADD CONSTRAINT FK_PRF_RUOLO_MENU_RUO
    FOREIGN KEY (ID_RUOLO)
    REFERENCES PRF_RUOLO(ID_RUOLO);
    
    ALTER TABLE PRF_RUOLO_MENU
    ADD CONSTRAINT FK_PRF_RUOLO_MENU_MENU
    FOREIGN KEY (ID_MENU)
    REFERENCES PRF_MENU(ID_MENU);
    
    ALTER TABLE PRF_UTENTE
    ADD CONSTRAINT FK_PRF_UTENTE_STA
    FOREIGN KEY (ID_STATO)
    REFERENCES PRF_STATO(ID_STATO);
    
    ALTER TABLE PRF_UTENTE_AREA
    ADD CONSTRAINT FK_PRF_UTENTE_AREA_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_UTENTE_AREA
    ADD CONSTRAINT FK_PRF_UTENTE_AREA_UTE
    FOREIGN KEY (ID_UTENTE)
    REFERENCES PRF_UTENTE(ID_UTENTE);
    
    ALTER TABLE PRF_UTENTE_AREA
    ADD CONSTRAINT FK_PRF_UTENTE_AREA_AREA
    FOREIGN KEY (ID_AREA)
    REFERENCES PRF_AREA(ID_AREA);
   
    ALTER TABLE PRF_UTENTE_RUOLO
    ADD CONSTRAINT FK_PRF_UTENTE_RUOLO_APP
    FOREIGN KEY (ID_APPLICAZIONE)
    REFERENCES PRF_APPLICAZIONE(ID_APPLICAZIONE);
    
    ALTER TABLE PRF_UTENTE_RUOLO
    ADD CONSTRAINT FK_PRF_UTENTE_RUOLO_UTE
    FOREIGN KEY (ID_UTENTE)
    REFERENCES PRF_UTENTE(ID_UTENTE);
    
    ALTER TABLE PRF_UTENTE_RUOLO
    ADD CONSTRAINT FK_PRF_UTENTE_RUOLO_RUO
    FOREIGN KEY (ID_RUOLO)
    REFERENCES PRF_RUOLO(ID_RUOLO);