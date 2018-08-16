CREATE TABLE "PHIMES"."PRF_ACCESSO" 
   (	"ID_ACCESSO" CHAR(1 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"ORDINE" NUMBER(5,0) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_ACCESSO" PRIMARY KEY ("ID_ACCESSO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_ACCESSO"."UT_MODIFICA" IS 'tecnici';
   
   
   CREATE TABLE "PHIMES"."PRF_APPLICAZIONE" 
   (	"ID_APPLICAZIONE" NUMBER(10,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"CODICE_DOMINIO_BASE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"FROFILAZIONE_DATI" CHAR(1 BYTE) NOT NULL ENABLE, 
	"SALTA_PROFILAZIONE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_APPLICAZIONE" PRIMARY KEY ("ID_APPLICAZIONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_APPLICAZIONE"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_APPLICAZIONE_TRG" 
  BEFORE INSERT ON PRF_APPLICAZIONE
  FOR EACH ROW
BEGIN
  :NEW.ID_APPLICAZIONE := PRF_APPLICAZIONE_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_APPLICAZIONE_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_AREA" 
   (	"ID_AREA" NUMBER(22,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_AREA" PRIMARY KEY ("ID_AREA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_AREA_TRG" 
  BEFORE INSERT ON PRF_AREA
  FOR EACH ROW
BEGIN
  :NEW.ID_AREA := PRF_AREA_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_AREA_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_AREA_FILTRO" 
   (	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_AREA_FILTRO"."UT_MODIFICA" IS 'tecnici';


CREATE TABLE "PHIMES"."PRF_FILTRO" 
   (	"ID_FILTRO" NUMBER(22,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE_LUNGA" VARCHAR2(256 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_FILTRO" PRIMARY KEY ("ID_FILTRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FILTRO"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_FILTRO_ID_TRG" 
  BEFORE INSERT ON PRF_FILTRO
  FOR EACH ROW
BEGIN
  :NEW.ID_FILTRO := PRF_FILTRO_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_FILTRO_ID_TRG" ENABLE;
 

CREATE TABLE "PHIMES"."PRF_FUNZIONE" 
   (	"ID_FUNZIONE" NUMBER(22,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_FUNZIONE" PRIMARY KEY ("ID_FUNZIONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_FUNZIONE"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_FUNZIONE_TRG" 
  BEFORE INSERT ON PRF_FUNZIONE
  FOR EACH ROW
BEGIN
  :NEW.ID_FUNZIONE := PRF_FUNZIONE_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_FUNZIONE_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_LIVELLO" 
   (	"ID_LIVELLO" NUMBER(10,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"ORDINE" NUMBER(5,0) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_LIVELLO" PRIMARY KEY ("ID_LIVELLO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_LIVELLO"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_LIVELLO_TRG" 
  BEFORE INSERT ON PRF_LIVELLO
  FOR EACH ROW
BEGIN
  :NEW.ID_LIVELLO := PRF_LIVELLO_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_LIVELLO_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_MENU" 
   (	"ID_MENU" NUMBER(22,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"URL" VARCHAR2(256 BYTE) NOT NULL ENABLE, 
	"ORDINE" NUMBER(5,0) NOT NULL ENABLE, 
	"TS_CRAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_MENU" PRIMARY KEY ("ID_MENU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."TS_CRAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_MENU"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_MENU_TRG" 
  BEFORE INSERT ON PRF_MENU
  FOR EACH ROW
BEGIN
  :NEW.ID_MENU := PRF_MENU_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_MENU_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_PARAMETRO" 
   (	"ID_PARAMETRO" VARCHAR2(128 BYTE) NOT NULL ENABLE, 
	"VALORE" VARCHAR2(256 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_PARAMETRO" PRIMARY KEY ("ID_PARAMETRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_PARAMETRO"."UT_MODIFICA" IS 'tecnici';


CREATE TABLE "PHIMES"."PRF_RUOLO" 
   (	"ID_RUOLO" NUMBER(22,0) NOT NULL ENABLE, 
	"CODICE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_RUOLO" PRIMARY KEY ("ID_RUOLO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_RUOLO_TRG" 
  BEFORE INSERT ON PRF_RUOLO
  FOR EACH ROW
BEGIN
  :NEW.ID_RUOLO := PRF_RUOLO_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_RUOLO_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_RUOLO_FUNZIONE" 
   (	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_FUNZIONE"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_FUNZIONE"."UT_CREAZIONE" IS 'tecnici';
   
   
   CREATE TABLE "PHIMES"."PRF_RUOLO_MENU" 
   (	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_MENU"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_RUOLO_MENU"."UT_CREAZIONE" IS 'tecnici';
   
   
   CREATE TABLE "PHIMES"."PRF_STATO" 
   (	"ID_STATO" CHAR(1 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(64 BYTE) NOT NULL ENABLE, 
	"ORDINE" NUMBER(5,0) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_STATO" PRIMARY KEY ("ID_STATO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_STATO"."UT_MODIFICA" IS 'tecnici';


CREATE TABLE "PHIMES"."PRF_UTENTE" 
   (	"ID_UTENTE" NUMBER(22,0) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"CODICE_DOMINIO" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	"TS_MODIFICA" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_MODIFICA" VARCHAR2(16 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "ID_UTENTE" PRIMARY KEY ("ID_UTENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."UT_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."TS_MODIFICA" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE"."UT_MODIFICA" IS 'tecnici';
 

  CREATE OR REPLACE TRIGGER "PHIMES"."PRF_UTENTE_TRG" 
  BEFORE INSERT ON PRF_UTENTE
  FOR EACH ROW
BEGIN
  :NEW.ID_UTENTE := PRF_UTENTE_seq.nextval;
END;
/
ALTER TRIGGER "PHIMES"."PRF_UTENTE_TRG" ENABLE;


CREATE TABLE "PHIMES"."PRF_UTENTE_AREA" 
   (	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_AREA"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_AREA"."UT_CREAZIONE" IS 'tecnici';


CREATE TABLE "PHIMES"."PRF_UTENTE_RUOLO" 
   (	"TS_CREAZIONE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UT_CREAZIONE" VARCHAR2(16 BYTE) NOT NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "PHIMES_D" ;
 

   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_RUOLO"."TS_CREAZIONE" IS 'tecnici';
 
   COMMENT ON COLUMN "PHIMES"."PRF_UTENTE_RUOLO"."UT_CREAZIONE" IS 'tecnici'; 