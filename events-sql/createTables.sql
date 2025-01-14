CREATE TABLE ORGANIZERS
(
  ID int  NOT NULL AUTO_INCREMENT,NAME varchar(20)  NOT NULL, 
  CREATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
  PRIMARY KEY (ID)
);


CREATE TABLE VENUES
(
  ID         int NOT NULL AUTO_INCREMENT,
  CREATED    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  NAME       varchar(256),
  STREET_ADDRESS    varchar(256),
  STREET_ADDRESS2   varchar(256),
  CITY              varchar(256),
  STATE             varchar(256),
  COUNTRY           VARCHAR(256),
  POSTAL_CODE       varchar(256),
  PRIMARY KEY (ID)
);


CREATE TABLE EVENTS
(
  ID              int	NOT NULL AUTO_INCREMENT,
  CREATED         TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
  NAME            varchar(256),
  DESCRIPTION     varchar(2048),
  START_TIME      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  END_TIME        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ZONE_ID         blob,
  STARTED       int,
  ORGANIZER_ID    int                          NOT NULL,
  VENUE_ID        int,
  PRIMARY KEY (ID),
  FOREIGN KEY (ORGANIZER_ID) REFERENCES ORGANIZERS(ID) ON DELETE CASCADE,
  FOREIGN KEY (VENUE_ID) REFERENCES VENUES(ID)
);


CREATE TABLE PARTICIPANTS
(
  ID  	int        NOT NULL AUTO_INCREMENT,
  CREATED    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  NAME      varchar(256) NOT NULL,
  EMAIL      varchar(256) NOT NULL,
  CHECKED_IN   int,
  EVENT_ID    int        NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (EVENT_ID) REFERENCES EVENTS(ID),
  UNIQUE (EVENT_ID, EMAIL)
);