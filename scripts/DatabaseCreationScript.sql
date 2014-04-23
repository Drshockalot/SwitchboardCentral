/*
  THIS SCRIPT PERFORMS THE FOLLOWING ACTIONS:
  - Drops all of the current tables of the relevant database, if they exist. 
  - Drops current versions of sequences with the same name as those associated with this database
  - Recreates sequences for all surrogate keys associated with Primary Keys in this database
  - Creates all of the tables necessary for this database
  - Performs GRANT statements on all of the tables to the appropriate team members
  - Creates indexes for Primary Keys used for each table
  - Creates necessary constraints for each table (Foreign Key, UNIQUE, NOT NULL, DEFAULT etc)
  - Creates Triggers for each sequence
*/

DROP TABLE "BOOKING" cascade constraints;
DROP TABLE "BUILDING" cascade constraints;
DROP TABLE "CONFIGURATION" cascade constraints;
DROP TABLE "EQUIPMENT" cascade constraints;
DROP TABLE "EQUIPMENTALLOCATION" cascade constraints;
DROP TABLE "EVENT" cascade constraints;
DROP TABLE "LOCATION" cascade constraints;
DROP TABLE "PCALLOCATION" cascade constraints;
DROP TABLE "STAFF" cascade constraints;
DROP SEQUENCE "BUILDINGID_SEQ";
DROP SEQUENCE "CONFIGURATIONTYPE_SEQ";
DROP SEQUENCE "EQUIPMENT_SEQ";
DROP SEQUENCE "EVENTBOOKING_SEQ";
DROP SEQUENCE "EVENT_SEQ";
DROP SEQUENCE "LOCATION_SEQ";
DROP SEQUENCE "PC_SEQ";
DROP SEQUENCE "STAFF_SEQ";
--------------------------------------------------------
--  DDL for Sequence BUILDINGID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BUILDINGID_SEQ"  MINVALUE 0 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1000 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CONFIGURATIONTYPE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CONFIGURATIONTYPE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EQUIPMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EQUIPMENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111047 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EVENTBOOKING_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EVENTBOOKING_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5008 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EVENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EVENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 110132 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PC_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 102238 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence STAFF_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STAFF_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOOKING
--------------------------------------------------------

  CREATE TABLE "BOOKING" 
   (	"LOCATIONID" NUMBER(6,0), 
	"EVENTID" NUMBER(6,0), 
	"EVENTSTART" DATE DEFAULT sysdate, 
	"EVENTEND" DATE DEFAULT sysdate
   ) ;
  GRANT FLASHBACK ON "BOOKING" TO "B2029843";
  GRANT FLASHBACK ON "BOOKING" TO "B2023876";
  GRANT DEBUG ON "BOOKING" TO "B2029843";
  GRANT DEBUG ON "BOOKING" TO "B2023876";
  GRANT QUERY REWRITE ON "BOOKING" TO "B2029843";
  GRANT QUERY REWRITE ON "BOOKING" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "BOOKING" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "BOOKING" TO "B2023876";
  GRANT REFERENCES ON "BOOKING" TO "B2029843";
  GRANT REFERENCES ON "BOOKING" TO "B2023876";
  GRANT UPDATE ON "BOOKING" TO "B2029843";
  GRANT UPDATE ON "BOOKING" TO "B2023876";
  GRANT SELECT ON "BOOKING" TO "B2029843";
  GRANT SELECT ON "BOOKING" TO "B2023876";
  GRANT INSERT ON "BOOKING" TO "B2029843";
  GRANT INSERT ON "BOOKING" TO "B2023876";
  GRANT INDEX ON "BOOKING" TO "B2029843";
  GRANT INDEX ON "BOOKING" TO "B2023876";
  GRANT DELETE ON "BOOKING" TO "B2029843";
  GRANT DELETE ON "BOOKING" TO "B2023876";
  GRANT ALTER ON "BOOKING" TO "B2029843";
  GRANT ALTER ON "BOOKING" TO "B2023876";
--------------------------------------------------------
--  DDL for Table BUILDING
--------------------------------------------------------

  CREATE TABLE "BUILDING" 
   (	"BUILDINGNAME" VARCHAR2(50 BYTE), 
	"CAMPUS" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"ADDRESS" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"RECEPTIONPHONENO" VARCHAR2(15 BYTE) DEFAULT NULL, 
	"BUILDINGID" NUMBER(4,0) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "BUILDING" TO "B2029843";
  GRANT FLASHBACK ON "BUILDING" TO "B2023876";
  GRANT DEBUG ON "BUILDING" TO "B2029843";
  GRANT DEBUG ON "BUILDING" TO "B2023876";
  GRANT QUERY REWRITE ON "BUILDING" TO "B2029843";
  GRANT QUERY REWRITE ON "BUILDING" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "BUILDING" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "BUILDING" TO "B2023876";
  GRANT REFERENCES ON "BUILDING" TO "B2029843";
  GRANT REFERENCES ON "BUILDING" TO "B2023876";
  GRANT UPDATE ON "BUILDING" TO "B2029843";
  GRANT UPDATE ON "BUILDING" TO "B2023876";
  GRANT SELECT ON "BUILDING" TO "B2029843";
  GRANT SELECT ON "BUILDING" TO "B2023876";
  GRANT INSERT ON "BUILDING" TO "B2029843";
  GRANT INSERT ON "BUILDING" TO "B2023876";
  GRANT INDEX ON "BUILDING" TO "B2029843";
  GRANT INDEX ON "BUILDING" TO "B2023876";
  GRANT DELETE ON "BUILDING" TO "B2029843";
  GRANT DELETE ON "BUILDING" TO "B2023876";
  GRANT ALTER ON "BUILDING" TO "B2029843";
  GRANT ALTER ON "BUILDING" TO "B2023876";
--------------------------------------------------------
--  DDL for Table CONFIGURATION
--------------------------------------------------------

  CREATE TABLE "CONFIGURATION" 
   (	"LOCATIONID" NUMBER(6,0), 
	"ROWCAPACITY" NUMBER(5,0) DEFAULT NULL, 
	"ISLANDCAPACITY" NUMBER(5,0) DEFAULT NULL, 
	"HORSESHOECAPACITY" NUMBER(5,0) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "CONFIGURATION" TO "B2029843";
  GRANT FLASHBACK ON "CONFIGURATION" TO "B2023876";
  GRANT DEBUG ON "CONFIGURATION" TO "B2029843";
  GRANT DEBUG ON "CONFIGURATION" TO "B2023876";
  GRANT QUERY REWRITE ON "CONFIGURATION" TO "B2029843";
  GRANT QUERY REWRITE ON "CONFIGURATION" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "CONFIGURATION" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "CONFIGURATION" TO "B2023876";
  GRANT REFERENCES ON "CONFIGURATION" TO "B2029843";
  GRANT REFERENCES ON "CONFIGURATION" TO "B2023876";
  GRANT UPDATE ON "CONFIGURATION" TO "B2029843";
  GRANT UPDATE ON "CONFIGURATION" TO "B2023876";
  GRANT SELECT ON "CONFIGURATION" TO "B2029843";
  GRANT SELECT ON "CONFIGURATION" TO "B2023876";
  GRANT INSERT ON "CONFIGURATION" TO "B2029843";
  GRANT INSERT ON "CONFIGURATION" TO "B2023876";
  GRANT INDEX ON "CONFIGURATION" TO "B2029843";
  GRANT INDEX ON "CONFIGURATION" TO "B2023876";
  GRANT DELETE ON "CONFIGURATION" TO "B2029843";
  GRANT DELETE ON "CONFIGURATION" TO "B2023876";
  GRANT ALTER ON "CONFIGURATION" TO "B2029843";
  GRANT ALTER ON "CONFIGURATION" TO "B2023876";
--------------------------------------------------------
--  DDL for Table EQUIPMENT
--------------------------------------------------------

  CREATE TABLE "EQUIPMENT" 
   (	"EQUIPMENTID" NUMBER(6,0), 
	"NAME" VARCHAR2(50 CHAR) DEFAULT NULL, 
	"TYPE" VARCHAR2(50 CHAR) DEFAULT NULL, 
	"MAKE" VARCHAR2(50 CHAR) DEFAULT NULL, 
	"DESCRIPTION" VARCHAR2(200 CHAR) DEFAULT NULL, 
	"CATEGORY" VARCHAR2(50 CHAR) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "EQUIPMENT" TO "B2029843";
  GRANT FLASHBACK ON "EQUIPMENT" TO "B2023876";
  GRANT DEBUG ON "EQUIPMENT" TO "B2029843";
  GRANT DEBUG ON "EQUIPMENT" TO "B2023876";
  GRANT QUERY REWRITE ON "EQUIPMENT" TO "B2029843";
  GRANT QUERY REWRITE ON "EQUIPMENT" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "EQUIPMENT" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "EQUIPMENT" TO "B2023876";
  GRANT REFERENCES ON "EQUIPMENT" TO "B2029843";
  GRANT REFERENCES ON "EQUIPMENT" TO "B2023876";
  GRANT UPDATE ON "EQUIPMENT" TO "B2029843";
  GRANT UPDATE ON "EQUIPMENT" TO "B2023876";
  GRANT SELECT ON "EQUIPMENT" TO "B2029843";
  GRANT SELECT ON "EQUIPMENT" TO "B2023876";
  GRANT INSERT ON "EQUIPMENT" TO "B2029843";
  GRANT INSERT ON "EQUIPMENT" TO "B2023876";
  GRANT INDEX ON "EQUIPMENT" TO "B2029843";
  GRANT INDEX ON "EQUIPMENT" TO "B2023876";
  GRANT DELETE ON "EQUIPMENT" TO "B2029843";
  GRANT DELETE ON "EQUIPMENT" TO "B2023876";
  GRANT ALTER ON "EQUIPMENT" TO "B2029843";
  GRANT ALTER ON "EQUIPMENT" TO "B2023876";
--------------------------------------------------------
--  DDL for Table EQUIPMENTALLOCATION
--------------------------------------------------------

  CREATE TABLE "EQUIPMENTALLOCATION" 
   (	"LOCATIONID" NUMBER(6,0), 
	"EQUIPMENTID" NUMBER(6,0), 
	"QUANTITY" NUMBER(6,0) DEFAULT 0
   ) ;
  GRANT FLASHBACK ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT FLASHBACK ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT DEBUG ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT DEBUG ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT QUERY REWRITE ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT QUERY REWRITE ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT REFERENCES ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT REFERENCES ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT UPDATE ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT UPDATE ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT SELECT ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT SELECT ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT INSERT ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT INSERT ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT INDEX ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT INDEX ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT DELETE ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT DELETE ON "EQUIPMENTALLOCATION" TO "B2023876";
  GRANT ALTER ON "EQUIPMENTALLOCATION" TO "B2029843";
  GRANT ALTER ON "EQUIPMENTALLOCATION" TO "B2023876";
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "EVENT" 
   (	"EVENTID" NUMBER(6,0), 
	"EVENTNAME" VARCHAR2(100 CHAR) DEFAULT NULL, 
	"EVENTPURPOSE" VARCHAR2(100 CHAR) DEFAULT NULL, 
	"FACULTY" VARCHAR2(100 CHAR) DEFAULT NULL, 
	"ORGANISER" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"STAFFID" NUMBER(6,0) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "EVENT" TO "B2029843";
  GRANT FLASHBACK ON "EVENT" TO "B2023876";
  GRANT DEBUG ON "EVENT" TO "B2029843";
  GRANT DEBUG ON "EVENT" TO "B2023876";
  GRANT QUERY REWRITE ON "EVENT" TO "B2029843";
  GRANT QUERY REWRITE ON "EVENT" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "EVENT" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "EVENT" TO "B2023876";
  GRANT REFERENCES ON "EVENT" TO "B2029843";
  GRANT REFERENCES ON "EVENT" TO "B2023876";
  GRANT UPDATE ON "EVENT" TO "B2029843";
  GRANT UPDATE ON "EVENT" TO "B2023876";
  GRANT SELECT ON "EVENT" TO "B2029843";
  GRANT SELECT ON "EVENT" TO "B2023876";
  GRANT INSERT ON "EVENT" TO "B2029843";
  GRANT INSERT ON "EVENT" TO "B2023876";
  GRANT INDEX ON "EVENT" TO "B2029843";
  GRANT INDEX ON "EVENT" TO "B2023876";
  GRANT DELETE ON "EVENT" TO "B2029843";
  GRANT DELETE ON "EVENT" TO "B2023876";
  GRANT ALTER ON "EVENT" TO "B2029843";
  GRANT ALTER ON "EVENT" TO "B2023876";
--------------------------------------------------------
--  DDL for Table LOCATION
--------------------------------------------------------

  CREATE TABLE "LOCATION" 
   (	"LOCATIONID" NUMBER(6,0), 
	"FLOOR" VARCHAR2(1 BYTE) DEFAULT NULL, 
	"TYPE" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"ROOMNO" VARCHAR2(4 BYTE) DEFAULT NULL, 
	"CURRENTCONFIG" VARCHAR2(1 BYTE) DEFAULT NULL, 
	"LENGTH" NUMBER(4,1) DEFAULT 0, 
	"WIDTH" NUMBER(4,1) DEFAULT 0, 
	"BUILDINGID" NUMBER(4,0) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "LOCATION" TO "B2029843";
  GRANT FLASHBACK ON "LOCATION" TO "B2023876";
  GRANT DEBUG ON "LOCATION" TO "B2029843";
  GRANT DEBUG ON "LOCATION" TO "B2023876";
  GRANT QUERY REWRITE ON "LOCATION" TO "B2029843";
  GRANT QUERY REWRITE ON "LOCATION" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "LOCATION" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "LOCATION" TO "B2023876";
  GRANT REFERENCES ON "LOCATION" TO "B2029843";
  GRANT REFERENCES ON "LOCATION" TO "B2023876";
  GRANT UPDATE ON "LOCATION" TO "B2029843";
  GRANT UPDATE ON "LOCATION" TO "B2023876";
  GRANT SELECT ON "LOCATION" TO "B2029843";
  GRANT SELECT ON "LOCATION" TO "B2023876";
  GRANT INSERT ON "LOCATION" TO "B2029843";
  GRANT INSERT ON "LOCATION" TO "B2023876";
  GRANT INDEX ON "LOCATION" TO "B2029843";
  GRANT INDEX ON "LOCATION" TO "B2023876";
  GRANT DELETE ON "LOCATION" TO "B2029843";
  GRANT DELETE ON "LOCATION" TO "B2023876";
  GRANT ALTER ON "LOCATION" TO "B2029843";
  GRANT ALTER ON "LOCATION" TO "B2023876";
--------------------------------------------------------
--  DDL for Table PCALLOCATION
--------------------------------------------------------

  CREATE TABLE "PCALLOCATION" 
   (	"PCID" NUMBER(6,0), 
	"PCROLE" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"LOCATIONID" NUMBER(6,0) DEFAULT NULL
   ) ;
  GRANT FLASHBACK ON "PCALLOCATION" TO "B2029843";
  GRANT FLASHBACK ON "PCALLOCATION" TO "B2023876";
  GRANT DEBUG ON "PCALLOCATION" TO "B2029843";
  GRANT DEBUG ON "PCALLOCATION" TO "B2023876";
  GRANT QUERY REWRITE ON "PCALLOCATION" TO "B2029843";
  GRANT QUERY REWRITE ON "PCALLOCATION" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "PCALLOCATION" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "PCALLOCATION" TO "B2023876";
  GRANT REFERENCES ON "PCALLOCATION" TO "B2029843";
  GRANT REFERENCES ON "PCALLOCATION" TO "B2023876";
  GRANT UPDATE ON "PCALLOCATION" TO "B2029843";
  GRANT UPDATE ON "PCALLOCATION" TO "B2023876";
  GRANT SELECT ON "PCALLOCATION" TO "B2029843";
  GRANT SELECT ON "PCALLOCATION" TO "B2023876";
  GRANT INSERT ON "PCALLOCATION" TO "B2029843";
  GRANT INSERT ON "PCALLOCATION" TO "B2023876";
  GRANT INDEX ON "PCALLOCATION" TO "B2029843";
  GRANT INDEX ON "PCALLOCATION" TO "B2023876";
  GRANT DELETE ON "PCALLOCATION" TO "B2029843";
  GRANT DELETE ON "PCALLOCATION" TO "B2023876";
  GRANT ALTER ON "PCALLOCATION" TO "B2029843";
  GRANT ALTER ON "PCALLOCATION" TO "B2023876";
--------------------------------------------------------
--  DDL for Table STAFF
--------------------------------------------------------

  CREATE TABLE "STAFF" 
   (	"STAFFID" NUMBER(6,0), 
	"NAME" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"JOB" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"WORKPHONENO" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"HOMEPHONENO" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"EMAIL" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"ADDRESS" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"POSTCODE" VARCHAR2(10 BYTE) DEFAULT NULL, 
	"LOCATIONID" NUMBER(6,0) DEFAULT NULL
   ) ;
  GRANT DEBUG ON "STAFF" TO "B2023876";
  GRANT QUERY REWRITE ON "STAFF" TO "B2029843";
  GRANT QUERY REWRITE ON "STAFF" TO "B2023876";
  GRANT ON COMMIT REFRESH ON "STAFF" TO "B2029843";
  GRANT ON COMMIT REFRESH ON "STAFF" TO "B2023876";
  GRANT REFERENCES ON "STAFF" TO "B2029843";
  GRANT REFERENCES ON "STAFF" TO "B2023876";
  GRANT UPDATE ON "STAFF" TO "B2029843";
  GRANT UPDATE ON "STAFF" TO "B2023876";
  GRANT SELECT ON "STAFF" TO "B2029843";
  GRANT SELECT ON "STAFF" TO "B2023876";
  GRANT INSERT ON "STAFF" TO "B2029843";
  GRANT INSERT ON "STAFF" TO "B2023876";
  GRANT INDEX ON "STAFF" TO "B2029843";
  GRANT INDEX ON "STAFF" TO "B2023876";
  GRANT DELETE ON "STAFF" TO "B2029843";
  GRANT DELETE ON "STAFF" TO "B2023876";
  GRANT ALTER ON "STAFF" TO "B2029843";
  GRANT ALTER ON "STAFF" TO "B2023876";
  GRANT FLASHBACK ON "STAFF" TO "B2029843";
  GRANT FLASHBACK ON "STAFF" TO "B2023876";
  GRANT DEBUG ON "STAFF" TO "B2029843";
  
--------------------------------------------------------
--  DDL for Index EQUIPMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EQUIPMENT_PK" ON "EQUIPMENT" ("EQUIPMENTID");
--------------------------------------------------------
--  DDL for Index NEWPCALLOCATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NEWPCALLOCATION_PK" ON "PCALLOCATION" ("PCID");
--------------------------------------------------------
--  DDL for Index BOOKING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOKING_PK" ON "BOOKING" ("EVENTID", "LOCATIONID");
--------------------------------------------------------
--  DDL for Index EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENT_PK" ON "EVENT" ("EVENTID");
--------------------------------------------------------
--  DDL for Index CONFIGURATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CONFIGURATION_PK" ON "CONFIGURATION" ("LOCATIONID");
--------------------------------------------------------
--  DDL for Index BUILDING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BUILDING_PK" ON "BUILDING" ("BUILDINGID");
--------------------------------------------------------
--  DDL for Index LOCATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOCATION_PK" ON "LOCATION" ("LOCATIONID");
--------------------------------------------------------
--  DDL for Index EQUIPMENTALLOCATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EQUIPMENTALLOCATION_PK" ON "EQUIPMENTALLOCATION" ("LOCATIONID", "EQUIPMENTID");
--------------------------------------------------------
--  DDL for Index STAFF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STAFF_PK" ON "STAFF" ("STAFFID") 
  ;
--------------------------------------------------------
--  Constraints for Table CONFIGURATION
--------------------------------------------------------

  ALTER TABLE "CONFIGURATION" ADD CONSTRAINT "CONFIGURATION_PK" PRIMARY KEY ("LOCATIONID") ENABLE;
  ALTER TABLE "CONFIGURATION" MODIFY ("LOCATIONID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EQUIPMENT
--------------------------------------------------------

  ALTER TABLE "EQUIPMENT" ADD CONSTRAINT "EQUIPMENT_PK" PRIMARY KEY ("EQUIPMENTID") ENABLE;
  ALTER TABLE "EQUIPMENT" MODIFY ("EQUIPMENTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUILDING
--------------------------------------------------------

  ALTER TABLE "BUILDING" ADD CONSTRAINT "BUILDING_PK" PRIMARY KEY ("BUILDINGID") ENABLE;
  ALTER TABLE "BUILDING" MODIFY ("BUILDINGNAME" NOT NULL ENABLE);
  ALTER TABLE "BUILDING" MODIFY ("BUILDINGID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "EVENT_PK" PRIMARY KEY ("EVENTID") ENABLE;
  ALTER TABLE "EVENT" MODIFY ("EVENTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STAFF
--------------------------------------------------------

  ALTER TABLE "STAFF" ADD CONSTRAINT "STAFF_PK" PRIMARY KEY ("STAFFID") ENABLE;
  ALTER TABLE "STAFF" MODIFY ("STAFFID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EQUIPMENTALLOCATION
--------------------------------------------------------

  ALTER TABLE "EQUIPMENTALLOCATION" ADD CONSTRAINT "EQUIPALLO_QUANTITY_CHK1" CHECK (QUANTITY >= 0) ENABLE;
  ALTER TABLE "EQUIPMENTALLOCATION" ADD CONSTRAINT "EQUIPMENTALLOCATION_PK" PRIMARY KEY ("LOCATIONID", "EQUIPMENTID") ENABLE;
  ALTER TABLE "EQUIPMENTALLOCATION" MODIFY ("LOCATIONID" NOT NULL ENABLE);
  ALTER TABLE "EQUIPMENTALLOCATION" MODIFY ("EQUIPMENTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOCATION
--------------------------------------------------------

  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_LENGTH_CHK" CHECK (LENGTH >= 0) ENABLE;
  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_PK" PRIMARY KEY ("LOCATIONID") ENABLE;
  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOCATION_WIDTH_CHK" CHECK (WIDTH >= 0) ENABLE;
  ALTER TABLE "LOCATION" MODIFY ("LOCATIONID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_PK" PRIMARY KEY ("EVENTID", "LOCATIONID") ENABLE;
  ALTER TABLE "BOOKING" MODIFY ("LOCATIONID" NOT NULL ENABLE);
  ALTER TABLE "BOOKING" MODIFY ("EVENTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PCALLOCATION
--------------------------------------------------------

  ALTER TABLE "PCALLOCATION" ADD CONSTRAINT "NEWPCALLOCATION_PK" PRIMARY KEY ("PCID") ENABLE;
  ALTER TABLE "PCALLOCATION" MODIFY ("PCID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_EVENT_FK" FOREIGN KEY ("EVENTID")
	  REFERENCES "EVENT" ("EVENTID") ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_LOCATION_FK" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION" ("LOCATIONID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONFIGURATION
--------------------------------------------------------

  ALTER TABLE "CONFIGURATION" ADD CONSTRAINT "CONFIG_LOCATION_FK" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION" ("LOCATIONID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EQUIPMENTALLOCATION
--------------------------------------------------------

  ALTER TABLE "EQUIPMENTALLOCATION" ADD CONSTRAINT "EQUIPALLO_EQUIPMENT_FK" FOREIGN KEY ("EQUIPMENTID")
	  REFERENCES "EQUIPMENT" ("EQUIPMENTID") DISABLE;
  ALTER TABLE "EQUIPMENTALLOCATION" ADD CONSTRAINT "EQUIPALLO_LOCATION_FK" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION" ("LOCATIONID") DISABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "EVENT" ADD CONSTRAINT "EVENT_STAFF_FK1" FOREIGN KEY ("STAFFID")
	  REFERENCES "STAFF" ("STAFFID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATION
--------------------------------------------------------

  ALTER TABLE "LOCATION" ADD CONSTRAINT "LOC_BUILDING_FK" FOREIGN KEY ("BUILDINGID")
	  REFERENCES "BUILDING" ("BUILDINGID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PCALLOCATION
--------------------------------------------------------

  ALTER TABLE "PCALLOCATION" ADD CONSTRAINT "NEWPCALLOCATION_FK1" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION" ("LOCATIONID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STAFF
--------------------------------------------------------

  ALTER TABLE "STAFF" ADD CONSTRAINT "STAFF_LOCATION_FK1" FOREIGN KEY ("LOCATIONID")
	  REFERENCES "LOCATION" ("LOCATIONID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger BUILDINGID_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BUILDINGID_TRIG" 
   before insert on "BUILDING" 
   for each row 
begin  
   if inserting then 
      if :NEW."BUILDINGID" is null then 
         select BUILDINGID_SEQ.nextval into :NEW."BUILDINGID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "BUILDINGID_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EQUIPMENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "EQUIPMENT_TRG" BEFORE INSERT ON EQUIPMENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.EQUIPMENTID IS NULL THEN
      SELECT EQUIPMENT_SEQ.NEXTVAL INTO :NEW.EQUIPMENTID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "EQUIPMENT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EVENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "EVENT_TRG" BEFORE INSERT ON EVENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.EVENTID IS NULL THEN
      SELECT EVENT_SEQ.NEXTVAL INTO :NEW.EVENTID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "EVENT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOCATION_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LOCATION_TRG" BEFORE INSERT ON LOCATION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.LOCATIONID IS NULL THEN
      SELECT LOCATION_SEQ.NEXTVAL INTO :NEW.LOCATIONID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "LOCATION_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STAFF_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "STAFF_TRG" BEFORE INSERT ON STAFF 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.STAFFID IS NULL THEN
      SELECT STAFF_SEQ.NEXTVAL INTO :NEW.STAFFID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "STAFF_TRG" ENABLE;