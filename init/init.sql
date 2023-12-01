SHOW DATABASES;
DROP DATABASE IF EXISTS DOV;
CREATE DATABASE DOV;
USE DOV;
SET GLOBAL time_zone = '+00:00';

CREATE TABLE OPTIONS(
   OPTION_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OPTION_ADDRESS VARCHAR(42) NOT NULL,
   BASE_ASSET VARCHAR(10) NOT NULL,
    COLLATERAL_ASSET VARCHAR(10) NOT NULL,
    EXPIRY TIMESTAMP,
    SYMBOL VARCHAR(20),
    ROUND INT NOT NULL
);

CREATE TABLE ORDERS(
   ORDER_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OPTION_ID INT NOT NULL,
    SYMBOL VARCHAR(20),
    POSITION VARCHAR(10),
    STRIKE_PRICE VARCHAR(64),
    STRIKE_INDEX INT NOT NULL,
    SETTLEMENT_PRICE VARCHAR(64),
    AMOUNT INT NOT NULL,
    PNL VARCHAR(64),
    ORDER_TIME TIMESTAMP,
    CLIENT_ADDRESS VARCHAR(42) NOT NULL,
    SETTLED INT,
    TOKEN_ID VARCHAR(64),
    FOREIGN KEY(OPTION_ID) REFERENCES OPTIONS(OPTION_ID) ON DELETE CASCADE
);

CREATE TABLE STRIKES(
   STRIKE_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OPTION_ID INT NOT NULL,
    STRIKE_PRICE VARCHAR(64),
    OPTION_PRICE VARCHAR(64),
    STRIKE_INDEX INT NOT NULL,
    FOREIGN KEY(OPTION_ID) REFERENCES OPTIONS(OPTION_ID) ON DELETE CASCADE
);

INSERT INTO OPTIONS(OPTION_ADDRESS, BASE_ASSET, COLLATERAL_ASSET, EXPIRY, SYMBOL, ROUND) VALUES ('0xfcAfdbC62E3B36D3aC0c0204F124Cf62c5273589', 'ETH', 'USDC', '2023-11-27 08:00:00', 'WEEKLY_ETH_PUT', 7);
INSERT INTO OPTIONS(OPTION_ADDRESS, BASE_ASSET, COLLATERAL_ASSET, EXPIRY, SYMBOL, ROUND) VALUES ('0xaEac67977A4F0de89Aa9129085Cbd15B0d1B4927', 'ETH', 'USDC', '2023-12-20 08:00:00', 'MONYHLY_ETH_PUT', 1);
INSERT INTO OPTIONS(OPTION_ADDRESS, BASE_ASSET, COLLATERAL_ASSET, EXPIRY, SYMBOL, ROUND) VALUES ('0x71Cb51c0a12743827751F3C0C325A223F3fFdC96', 'ARB', 'USDC', '2023-11-27 08:00:00', 'WEELY_ARB_PUT', 1);
INSERT INTO OPTIONS(OPTION_ADDRESS, BASE_ASSET, COLLATERAL_ASSET, EXPIRY, SYMBOL, ROUND) VALUES ('0x535864C6521650F7a3D7Cc69dEa44cfC4C5A06F2', 'ARB', 'USDC', '2023-12-20 08:00:00', 'MONYHLY_ARB_PUT', 1);

INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (1, '2000', '80.42', 0);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (1, '1950', '58.12', 1);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (1, '1900', '40.28', 2);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (1, '1800', '16.68', 3);

INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (2, '2000', '149.99', 0);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (2, '1950', '149.99', 1);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (2, '1900', '126.80', 2);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (2, '1800', '87.18', 3);

INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (3, '1.00', '0.0216', 0);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (3, '0.95', '0.0095', 1);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (3, '0.90', '0.0033', 2);
INSERT INTO STRIKES(OPTION_ID, STRIKE_PRICE, OPTION_PRICE, STRIKE_INDEX)
VALUES (3, '0.80', '0.0002', 3);

CREATE USER 'DOV_ADMIN'@'%' IDENTIFIED BY '1q2w3e4r';
GRANT ALL PRIVILEGES ON DOV.* TO 'DOV_ADMIN'@'%';
FLUSH PRIVILEGES;
