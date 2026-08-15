//1. USERS
CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE users (
    user_id     NUMBER(19) PRIMARY KEY,
    name        VARCHAR2(20) NOT NULL,
    email       VARCHAR2(25) NOT NULL,
    phone       VARCHAR2(15),
    password    VARCHAR2(25) NOT NULL,
    role        VARCHAR2(20) DEFAULT 'PASSENGER',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT  uq_users_email UNIQUE (email)
);

desc users;

// 2. METRO CARD

CREATE SEQUENCE metro_card_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    drop sequence metro_card_seq;
    
CREATE TABLE metro_card (
    card_id      NUMBER(19) PRIMARY KEY,
    card_number  VARCHAR2(20) NOT NULL,
    balance      NUMBER(10, 2) DEFAULT 0,
    status       VARCHAR2(20) DEFAULT 'ACTIVE',
    user_id      NUMBER(19) NOT NULL,
    issued_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT   uq_card_number UNIQUE (card_number),
    CONSTRAINT   fk_metro_card_user FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);

//3.STATION 

CREATE SEQUENCE station_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

drop sequence station_seq;


CREATE TABLE station (
    station_id    NUMBER(19) PRIMARY KEY,
    station_name  VARCHAR2(100) NOT NULL,
    station_code  VARCHAR2(20) NOT NULL,
    location      VARCHAR2(255),
    CONSTRAINT    uq_station_code UNIQUE (station_code)
);




    
    


  