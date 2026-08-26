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

//4. ROUTE

CREATE SEQUENCE route_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    drop sequence route_seq;
    

CREATE TABLE route (
    route_id    NUMBER(19) PRIMARY KEY,
    route_name  VARCHAR2(100) NOT NULL
);

//5. ROUTE STATION MAPPING (Composite PK)
CREATE SEQUENCE route_station_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE route_station (
    route_id     NUMBER(19) NOT NULL,
    station_id   NUMBER(19) NOT NULL,
    sequence_no  NUMBER(10),
    CONSTRAINT   pk_route_station PRIMARY KEY (route_id, station_id),
    CONSTRAINT   fk_rs_route FOREIGN KEY (route_id)
        REFERENCES route (route_id),
    CONSTRAINT   fk_rs_station FOREIGN KEY (station_id)
        REFERENCES station (station_id)
);

//6. TRIP

CREATE SEQUENCE trip_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    drop sequence trip_seq;
    
CREATE TABLE trip (
    trip_id           NUMBER(19) PRIMARY KEY,
    card_id           NUMBER(19) NOT NULL,
    entry_station_id  NUMBER(19) NOT NULL,
    exit_station_id   NUMBER(19),
    start_time        TIMESTAMP NOT NULL,
    end_time          TIMESTAMP,
    fare_amount       NUMBER(10, 2),
    CONSTRAINT        fk_trip_card FOREIGN KEY (card_id)
        REFERENCES metro_card (card_id),
    CONSTRAINT        fk_trip_entry_station FOREIGN KEY (entry_station_id)
        REFERENCES station (station_id),
    CONSTRAINT        fk_trip_exit_station FOREIGN KEY (exit_station_id)
        REFERENCES station (station_id)
);

//7. TRANSACTION HISTORY

CREATE SEQUENCE txn_history_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    DROP SEQUENCE TXN_HISTORY_SEQ;
    
 CREATE TABLE transaction_history (
    txn_id      NUMBER(19) PRIMARY KEY,
    card_id     NUMBER(19) NOT NULL,
    amount      NUMBER(10, 2) NOT NULL,
    txn_type    VARCHAR2(30) NOT NULL,
    txn_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT  fk_txn_card FOREIGN KEY (card_id)
        REFERENCES metro_card (card_id),
    CONSTRAINT  chk_txn_type CHECK (txn_type IN ('RECHARGE', 'TRIP_FARE', 'REFUND'))
);

//8. PAYMENT

CREATE SEQUENCE payment_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    DROP SEQUENCE PAYMENT_SEQ;
    
CREATE TABLE payment (
    payment_id      NUMBER(19) PRIMARY KEY,
    card_id         NUMBER(19) NOT NULL,
    amount          NUMBER(10, 2) NOT NULL,
    payment_method  VARCHAR2(20),
    status          VARCHAR2(20),
    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT      fk_payment_card FOREIGN KEY (card_id)
        REFERENCES metro_card (card_id)
);


   








    
    


  