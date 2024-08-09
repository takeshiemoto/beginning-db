-- init.sql

-- 担当者テーブルの作成
CREATE TABLE IF NOT EXISTS agents
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(100),
    phone      VARCHAR(15)
);

-- 自動車メーカーのマスターテーブルの作成
CREATE TABLE IF NOT EXISTS car_makers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 車のテーブルの作成
CREATE TABLE IF NOT EXISTS cars
(
    id       SERIAL PRIMARY KEY,
    maker_id INT REFERENCES car_makers (id),
    model    VARCHAR(50),
    year     INT,
    price    INT
);

-- 顧客テーブルの作成
CREATE TABLE IF NOT EXISTS customers
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email      VARCHAR(100),
    phone      VARCHAR(15),
    address    VARCHAR(255)
);

-- 販売実績テーブルの作成
CREATE TABLE IF NOT EXISTS sales
(
    id          SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers (id),
    car_id      INT REFERENCES cars (id),
    agent_id    INT REFERENCES agents (id),
    sale_date   DATE,
    sale_price  INT
);

-- メンテナンス履歴（来店）テーブルの作成
CREATE TABLE IF NOT EXISTS maintenance
(
    id               SERIAL PRIMARY KEY,
    customer_id      INT REFERENCES customers (id),
    car_id           INT REFERENCES cars (id),
    maintenance_date DATE,
    details          TEXT
);