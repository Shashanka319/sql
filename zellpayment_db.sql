-- Drop tables in reverse order of foreign key dependencies
BEGIN
   FOR cur_rec IN (SELECT table_name FROM user_tables WHERE table_name IN (
       'TRANSACTION_LOGS', 'TRANSACTIONS', 'ZELLE_ALIAS', 
       'BANK_ACCOUNTS', 'TRANSACTION_LIMITS', 'USER_DEVICES', 
       'OTP_VERIFICATIONS', 'USERS'
   )) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS PURGE';
   END LOOP;
END;
/

-- Drop sequences if they already exist
BEGIN
   FOR cur_seq IN (SELECT sequence_name FROM user_sequences WHERE sequence_name IN (
       'SEQ_USERS', 'SEQ_OTP_VERIFICATIONS', 'SEQ_USER_DEVICES', 
       'SEQ_TRANSACTION_LIMITS', 'SEQ_BANK_ACCOUNTS', 'SEQ_ZELLE_ALIAS', 
       'SEQ_TRANSACTIONS', 'SEQ_TRANSACTION_LOGS'
   )) LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || cur_seq.sequence_name;
   END LOOP;
END;
/



SET DEFINE OFF;

-- =========================================================
-- 1. USERS
-- =========================================================
CREATE TABLE users (
    user_id       NUMBER(19) NOT NULL,
    full_name     VARCHAR2(255),
    email         VARCHAR2(255),
    phone_number  VARCHAR2(255),
    password_hash VARCHAR2(255),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status        VARCHAR2(255),
    CONSTRAINT pk_users PRIMARY KEY (user_id)
);


CREATE SEQUENCE seq_users START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_users_bi
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF :NEW.user_id IS NULL THEN
        SELECT seq_users.NEXTVAL INTO :NEW.user_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 2. OTP_VERIFICATIONS
-- =========================================================
CREATE TABLE otp_verifications (
    otp_id     NUMBER(19) NOT NULL,
    user_id    NUMBER(19) NOT NULL,
    otp_code   VARCHAR2(255),
    purpose    VARCHAR2(255),
    expires_at TIMESTAMP,
    verified   NUMBER(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_otp_verifications PRIMARY KEY (otp_id),
    CONSTRAINT fk_otp_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_otp_verified CHECK (verified IN (0, 1))
);

CREATE SEQUENCE seq_otp_verifications START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_otp_bi
BEFORE INSERT ON otp_verifications
FOR EACH ROW
BEGIN
    IF :NEW.otp_id IS NULL THEN
        SELECT seq_otp_verifications.NEXTVAL INTO :NEW.otp_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 3. USER_DEVICES
-- =========================================================
CREATE TABLE user_devices (
    device_id    NUMBER(19) NOT NULL,
    user_id      NUMBER(19) NOT NULL,
    device_type  VARCHAR2(255),
    device_token VARCHAR2(255),
    last_login   TIMESTAMP,
    CONSTRAINT pk_user_devices PRIMARY KEY (device_id),
    CONSTRAINT fk_device_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_user_devices START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_user_devices_bi
BEFORE INSERT ON user_devices
FOR EACH ROW
BEGIN
    IF :NEW.device_id IS NULL THEN
        SELECT seq_user_devices.NEXTVAL INTO :NEW.device_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 4. TRANSACTION_LIMITS
-- =========================================================
CREATE TABLE transaction_limits (
    limit_id      NUMBER(19) NOT NULL,
    user_id       NUMBER(19) NOT NULL,
    daily_limit   NUMBER(12, 2),
    per_txn_limit NUMBER(12, 2),
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_transaction_limits PRIMARY KEY (limit_id),
    CONSTRAINT fk_limits_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_transaction_limits START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_transaction_limits_bi
BEFORE INSERT ON transaction_limits
FOR EACH ROW
BEGIN
    IF :NEW.limit_id IS NULL THEN
        SELECT seq_transaction_limits.NEXTVAL INTO :NEW.limit_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 5. BANK_ACCOUNTS
-- =========================================================
CREATE TABLE bank_accounts (
    account_id     NUMBER(19) NOT NULL,
    user_id        NUMBER(19) NOT NULL,
    bank_name      VARCHAR2(255),
    account_number VARCHAR2(255),
    ifsc_code      VARCHAR2(255),
    is_primary     NUMBER(1) DEFAULT 0,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_bank_accounts PRIMARY KEY (account_id),
    CONSTRAINT fk_ba_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_ba_is_primary CHECK (is_primary IN (0, 1))
);

CREATE SEQUENCE seq_bank_accounts START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_bank_accounts_bi
BEFORE INSERT ON bank_accounts
FOR EACH ROW
BEGIN
    IF :NEW.account_id IS NULL THEN
        SELECT seq_bank_accounts.NEXTVAL INTO :NEW.account_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 6. ZELLE_ALIAS
-- =========================================================
CREATE TABLE zelle_alias (
    alias_id    NUMBER(19) NOT NULL,
    user_id     NUMBER(19) NOT NULL,
    alias_type  VARCHAR2(255),
    alias_value VARCHAR2(255),
    account_id  NUMBER(19) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_zelle_alias PRIMARY KEY (alias_id),
    CONSTRAINT fk_alias_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_alias_account FOREIGN KEY (account_id) REFERENCES bank_accounts(account_id)
);

CREATE SEQUENCE seq_zelle_alias START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_zelle_alias_bi
BEFORE INSERT ON zelle_alias
FOR EACH ROW
BEGIN
    IF :NEW.alias_id IS NULL THEN
        SELECT seq_zelle_alias.NEXTVAL INTO :NEW.alias_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 7. TRANSACTIONS
-- =========================================================
CREATE TABLE transactions (
    transaction_id      NUMBER(19) NOT NULL,
    sender_user_id      NUMBER(19) NOT NULL,
    receiver_user_id    NUMBER(19) NOT NULL,
    sender_account_id   NUMBER(19) NOT NULL,
    receiver_account_id NUMBER(19) NOT NULL,
    amount              NUMBER(12, 2),
    currency            VARCHAR2(255),
    status              VARCHAR2(255),
    reference_note      VARCHAR2(255),
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at        TIMESTAMP,
    CONSTRAINT pk_transactions PRIMARY KEY (transaction_id),
    CONSTRAINT fk_txn_sender_user FOREIGN KEY (sender_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_txn_receiver_user FOREIGN KEY (receiver_user_id) REFERENCES users(user_id),
    CONSTRAINT fk_txn_sender_acc FOREIGN KEY (sender_account_id) REFERENCES bank_accounts(account_id),
    CONSTRAINT fk_txn_receiver_acc FOREIGN KEY (receiver_account_id) REFERENCES bank_accounts(account_id)
);

CREATE SEQUENCE seq_transactions START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_transactions_bi
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF :NEW.transaction_id IS NULL THEN
        SELECT seq_transactions.NEXTVAL INTO :NEW.transaction_id FROM dual;
    END IF;
END;
/

-- =========================================================
-- 8. TRANSACTION_LOGS
-- =========================================================
CREATE TABLE transaction_logs (
    log_id         NUMBER(19) NOT NULL,
    transaction_id NUMBER(19) NOT NULL,
    message        VARCHAR2(255),
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_transaction_logs PRIMARY KEY (log_id),
    CONSTRAINT fk_log_txn FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_transaction_logs START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_transaction_logs_bi
BEFORE INSERT ON transaction_logs
FOR EACH ROW
BEGIN
    IF :NEW.log_id IS NULL THEN
        SELECT seq_transaction_logs.NEXTVAL INTO :NEW.log_id FROM dual;
    END IF;
END;


/